# -*- coding: utf-8 -*-
from django.conf.urls import url

from .views import OrgView, AddUserAsk, OrgHome, OrgCourseHome, OrgDescHome, TeacherHome

urlpatterns = [
    url(r'^list/$', OrgView.as_view(), name='list'),
    url(r'^add_ask/$', AddUserAsk.as_view(), name='add_ask'),
    url(r'^home/(?P<org_id>\d+)/$', OrgHome.as_view(), name='home'),
    url(r'^course/(?P<org_id>\d+)/$', OrgCourseHome.as_view(), name='course_home'),
    url(r'^teacher/(?P<org_id>\d+)/$', TeacherHome.as_view(), name='teacher_home'),
    url(r'^desc/(?P<org_id>\d+)/$', OrgDescHome.as_view(), name='desc_home')
]