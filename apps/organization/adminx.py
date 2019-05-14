# -*-coding:utf-8 -*-

import xadmin
from courses.models import Course, Lesson, Video, CourseResource
from organization.models import CityDict, CourseOrg, Teacher
from users.models import EmailVerifyRecord, Banner


class CityDictAdmin(object):
    search_fields = ['name', 'desc', 'add_time']
    list_display = ['name', 'desc', 'add_time']
    list_filter = ['name', 'desc']


class CourseOrgAdmin(object):
    search_fields = ['name', 'desc', 'fav_nums', 'image', 'address', 'city', 'add_time']
    list_display = ['name', 'desc', 'fav_nums', 'image', 'address', 'city', 'add_time']
    list_filter = ['name', 'desc', 'fav_nums', 'image', 'address', 'city']


class TeacherAdmin(object):
    search_fields = ['org', 'name', 'work_years', 'work_company', 'work_position', 'click_nums', 'fav_nums', 'add_time']
    list_display = ['org', 'name', 'work_years',  'work_company', 'work_position', 'click_nums', 'fav_nums', 'add_time']
    list_filter = ['org', 'name', 'work_years', 'work_company', 'work_position', 'click_nums', 'fav_nums']


xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)

