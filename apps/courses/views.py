# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.core.paginator import PageNotAnInteger

from django.shortcuts import render

# Create your views here.
from django.views.generic import View
from pure_pagination import Paginator

from courses.models import Course, Lesson, Notification, TeacherNotice
from operation.models import UserFavorite
from organization.models import Teacher


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
        has_fav_course = False
        has_fav_org = False
        tag = course.tag
        if tag:
            rec_course = Course.objects.filter(tag=tag)[:1]
        else:
            rec_course = {}
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course_id), fav_type=int(1)):  # 课程
                has_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=int(course.org_id), fav_type=int(2)):  # 机构
                has_fav_org = True
        return render(request, 'course-detail.html', {
            'course': course,
            'has_fav_course': has_fav_course,
            'has_fav_org': has_fav_org,
            'rec_course': rec_course
        })


class CourseLessonsView(View):
    def get(self, request, course_id):
        global teacher_notice
        course = Course.objects.get(id=course_id)
        lessons = Lesson.objects.filter(course=course)
        notice = Notification.objects.get(course=course_id)
        teacher = Teacher.objects.get(course=course_id)
        if teacher:
            teacher_notice = TeacherNotice.objects.get(teacher=teacher,course = course)
        return render(request, 'course-video.html', {
            'course': course,
            'teacher_notice':teacher_notice,
            'teacher':teacher,
            'notice': notice,
            'lessons': lessons,
            'current_page': 'lessons'
        })


class CourseCommentsView(View):
    def get(self, request, course_id):
        course = Course.objects.get(id=course_id)
        return render(request, 'course-comment.html', {
            'course': course,
            'current_page': 'comments'
        })