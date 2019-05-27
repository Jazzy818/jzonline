# -*-coding:utf-8 -*-

import xadmin
from operation.models import UserAsk, CourseComments, UserFavorite, UserMessage, UserCourse
from users.models import EmailVerifyRecord, Banner


class UserAskAdmin(object):
    search_fields = ['name', 'mobile', 'course_name', 'add_time']
    list_display = ['name', 'mobile', 'course_name', 'add_time']
    list_filter = ['name', 'mobile', 'course_name']


class CourseCommentsAdmin(object):
    search_fields = ['user', 'course', 'comments', 'add_time']
    list_display = ['user', 'course', 'comments', 'add_time']
    list_filter = ['user__nick_name', 'course__name', 'comments']


class UserFavoriteAdmin(object):
    search_fields = ['user', 'course', 'fav_id', 'fav_type', 'add_time']
    list_display = ['user', 'course', 'fav_id', 'fav_type', 'add_time']
    list_filter = ['user__nick_name', 'course__name', 'fav_id', 'fav_type']


class UserMessageAdmin(object):
    search_fields = ['user', 'message', 'has_read', 'add_time']
    list_display = ['user', 'message', 'has_read', 'add_time']
    list_filter = ['user', 'message', 'has_read']


class UserCourseAdmin(object):
    search_fields = ['user', 'course', 'add_time']
    list_display = ['user', 'course','add_time']
    list_filter = ['user',  'course']


xadmin.site.register(UserAsk, UserAskAdmin)
xadmin.site.register(CourseComments, CourseCommentsAdmin)
xadmin.site.register(UserFavorite, UserFavoriteAdmin)
xadmin.site.register(UserMessage, UserMessageAdmin)
xadmin.site.register(UserCourse, UserCourseAdmin)
