# -*- coding: utf-8 -*-
from django.conf.urls import url

from courses.views import CourseView, CourseDetailView

urlpatterns = [
    url(r'^list/$', CourseView.as_view(), name='course_list'),
    url(r'^detail/(?P<course_id>\d+)$', CourseDetailView.as_view(), name='course_detail')

]