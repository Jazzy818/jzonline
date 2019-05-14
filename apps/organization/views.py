# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.http import HttpResponse
from django.shortcuts import render, render_to_response

# Create your views here.
from django.views.decorators.csrf import csrf_exempt
from django.views.generic import View
from pure_pagination import Paginator, PageNotAnInteger

from organization.forms import UerAskForm
from organization.models import CourseOrg, CityDict


class OrgView(View):
    '''课程机构列表'''

    def get(self, request):
        courses = CourseOrg.objects.all()
        cities = CityDict.objects.all()
        hot_orgs = courses.order_by("-click_nums")[:3]
        city_id = request.GET.get('city', "")
        if city_id:
            courses = courses.filter(city_id=int(city_id))
        category = request.GET.get('ct', "")
        if category:
            courses = courses.filter(category=category)
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "students":
                courses = courses.order_by("-students")
            elif sort == "course_nums":
                courses = courses.order_by("-course_nums")
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        course_num = courses.count()
        # 课程机构分页
        p = Paginator(courses, 3, request=request)

        courses = p.page(page)

        return render(request, 'org-list.html', {
            "courses": courses,
            "cities": cities,
            "course_num": course_num,
            "city_id": city_id,
            "category": category,
            "hot_orgs": hot_orgs,
            "sort_type": sort
        })


class AddUserAsk(View):
    '''
    我要咨询
    '''

    def post(self,request):
        userask_form = UerAskForm(request.POST)
        if userask_form.is_valid():
            user_ask = userask_form.save(commit=True)
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail","msg":{0}}'.format(userask_form.errors), content_type='application/json')


class OrgHome(View):
    def get(self,request,org_id):
        current_page = 'home'
        all_orgs = CourseOrg.objects.get(id=int(org_id))
        all_courses = all_orgs.course_set.all()[:3]
        all_teachers = all_orgs.teacher_set.all()[:1]
        # hot_orgs = all_orgs.order_by("-click_nums")[:3]
        return render(request, 'org-detail-homepage.html',{
            'all_courses': all_courses,
            'all_teachers': all_teachers,
            'course_org': all_orgs,
            'current_page': current_page
        })


class OrgCourseHome(View):
    def get(self,request,org_id):
        all_orgs = CourseOrg.objects.get(id=int(org_id))
        all_courses = all_orgs.course_set.all()
        current_page = 'course'
        # hot_orgs = all_orgs.order_by("-click_nums")[:3]
        return render(request, 'org-detail-course.html',{
            'all_courses': all_courses,
            'current_page': current_page,
            'course_org': all_orgs
        })


class OrgDescHome(View):
    def get(self,request,org_id):
        all_orgs = CourseOrg.objects.get(id=int(org_id))
        all_courses = all_orgs.course_set.all()
        current_page = 'desc'
        # hot_orgs = all_orgs.order_by("-click_nums")[:3]
        return render(request, 'org-detail-desc.html', {
            'all_courses': all_courses,
            'current_page': current_page,
            'course_org': all_orgs
        })


class TeacherHome(View):
    def get(self, request, org_id):
        all_orgs = CourseOrg.objects.get(id=int(org_id))
        current_page = 'teacher'
        all_teachers = all_orgs.teacher_set.all()

        return render(request, 'org-detail-teachers.html', {
            'all_teachers': all_teachers,
            'current_page': current_page,
            'course_org': all_orgs
        })