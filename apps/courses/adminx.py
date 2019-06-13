# -*-coding:utf-8 -*-

import xadmin
from courses.models import Course, Lesson, Video, CourseResource
from users.models import EmailVerifyRecord, Banner


class CourseAdmin(object):
    search_fields = ['name', 'desc', 'detail', 'degree', 'students']
    list_display = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students']
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_times', 'students']


class LessonAdmin(object):
    search_fields = ['course', 'name']
    list_display = ['course', 'name', 'add_time']
    list_filter = ['course__name', 'name', 'add_time']


class VideoAdmin(object):
    search_fields = ['mins','course','lesson', 'name']
    list_display = ['mins','course','lesson', 'name', 'add_time']
    list_filter = ['course__name','lesson__name', 'name', 'add_time','mins']


class CourseResourceAdmin(object):
    search_fields = ['course', 'name', 'download']
    list_display = ['course', 'name', 'download', 'add_time']
    list_filter = ['course__name', 'name', 'download', 'add_time']


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)

