# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from datetime import datetime

from django.db import models
from organization.models import CourseOrg, Teacher


class Course(models.Model):
    name = models.CharField(max_length=50, verbose_name=u"课程名")
    desc = models.CharField(max_length=300, verbose_name=u"课程描述")
    category = models.CharField(max_length=40, verbose_name=u"课程类别",default="后端开发")
    detail = models.TextField(verbose_name=u"课程详情")
    teacher = models.ForeignKey(Teacher, max_length=50, verbose_name=u"授课老师", blank=True)
    degree = models.CharField(max_length=10, choices=(("cj", "初级"), ("zj", u"中级"), ("gj", u"高级")))
    learn_times = models.IntegerField(default=0, verbose_name=u"学习时长(分钟)")
    org = models.ForeignKey(CourseOrg, verbose_name=u"所属机构", null=True, blank=True)
    students = models.IntegerField(default=0, verbose_name=u"学习人数")
    fav_nums = models.IntegerField(default=0, verbose_name=u"收藏数")
    tag = models.CharField(max_length=20, verbose_name=u"课程标签",blank= True)
    image = models.ImageField(upload_to="course/%Y/%m", verbose_name=u"封面图" )  # 年月
    click_nums = models.IntegerField(default=0, verbose_name=u"点击数")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程"
        verbose_name_plural = verbose_name

    def get_zj_nums(self):
        return self.lesson_set.all().count()

    def get_learn_students(self):
        return self.usercourse_set.all()[:5]

    def get_lessons(self):
        return self.lesson_set.all()

    def __unicode__(self):
        return self.name


class Lesson(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程名")
    name = models.CharField(max_length=100, verbose_name=u"章节名")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"章节"
        verbose_name_plural = verbose_name

    def get_video(self):
        return self.video_set.all()

    def __unicode__(self):
        return self.name


class Video(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"视频名",blank=True)
    lesson = models.ForeignKey(Lesson, verbose_name=u"章节")
    name = models.CharField(max_length=100, verbose_name=u"视频名")
    mins = models.CharField(max_length=10, default="10:00", verbose_name=u"时长")
    add_time = models.DateTimeField(default =datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"视频"
        verbose_name_plural = verbose_name


class CourseResource(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程")
    name = models.CharField(max_length=100, verbose_name=u"名称")
    download = models.FileField(upload_to="course/resource/%Y%m", verbose_name=u"资源文件", max_length=100)
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程资源"
        verbose_name_plural = verbose_name


class Notification(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程")
    statement = models.CharField(max_length=100, verbose_name=u"公告")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"课程公告"
        verbose_name_plural = verbose_name


class TeacherNotice(models.Model):
    course = models.ForeignKey(Course, verbose_name=u"课程")
    teacher = models.ForeignKey(Teacher, verbose_name=u"教师" )
    learn_what = models.CharField(max_length=200, verbose_name=u"学到什么")
    notice = models.CharField(max_length=200, verbose_name=u"课程须知")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u"添加时间")

    class Meta:
        verbose_name = u"老师寄语"
        verbose_name_plural = verbose_name