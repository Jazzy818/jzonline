# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.paginator import PageNotAnInteger
from django.shortcuts import render

# Create your views here.
from django.views.generic import View
from pure_pagination import Paginator

from courses.models import Course, Lesson


class CourseView(View):

    def get(self, request):
        active_page = 'courses'
        all_courses = Course.objects.all()
        hot_courses = all_courses.order_by("-click_nums")[:3]
        sort = request.GET.get('sort', 'latest')
        if sort == 'latest':
            all_courses = all_courses.order_by("-add_time")
        elif sort == 'hotest':
            all_courses = all_courses.order_by("-click_nums")

        elif sort == 'students':
            all_courses = all_courses.order_by("-students")
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        course_num = all_courses.count()
        # 课程机构分页
        p = Paginator(all_courses, 6, request=request)

        all_courses = p.page(page)
        return render(request, 'course-list.html', {
            "active_page": active_page,
            "courses": all_courses,
            "hot_courses": hot_courses,
            "sort_type": sort
        })


class CourseDetailView(View):

    def get(self, request, course_id):
        course = Course.objects.get(id=course_id)
        course.click_nums += 1
        course.save()

        return render(request,'course-detail.html',{
            'course': course
        })