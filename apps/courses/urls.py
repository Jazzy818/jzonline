# -*- coding: utf-8 -*-
from django.conf.urls import url

from courses.views import CourseView, CourseDetailView, CourseLessonsView, CourseCommentsView

urlpatterns = [
    url(r'^list/$', CourseView.as_view(), name='course_list'),
    url(r'^detail/(?P<course_id>\d+)$', CourseDetailView.as_view(), name='course_detail'),
    url(r'^lessons/(?P<course_id>\d+)$', CourseLessonsView.as_view(), name='course_lessons'),
    url(r'^comment/(?P<course_id>\d+)$', CourseCommentsView.as_view(), name='course_comments')

]