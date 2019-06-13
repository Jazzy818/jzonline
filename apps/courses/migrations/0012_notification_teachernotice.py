# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2019-06-09 12:44
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0011_auto_20190609_1201'),
    ]

    operations = [
        migrations.CreateModel(
            name='Notification',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('statement', models.CharField(max_length=100, verbose_name='\u516c\u544a')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='\u6dfb\u52a0\u65f6\u95f4')),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='courses.Course', verbose_name='\u8bfe\u7a0b')),
            ],
            options={
                'verbose_name': '\u8bfe\u7a0b\u516c\u544a',
                'verbose_name_plural': '\u8bfe\u7a0b\u516c\u544a',
            },
        ),
        migrations.CreateModel(
            name='TeacherNotice',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('learn_what', models.CharField(max_length=200, verbose_name='\u5b66\u5230\u4ec0\u4e48')),
                ('notice', models.CharField(max_length=200, verbose_name='\u8bfe\u7a0b\u987b\u77e5')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='\u6dfb\u52a0\u65f6\u95f4')),
                ('course', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='courses.Course', verbose_name='\u8bfe\u7a0b')),
            ],
            options={
                'verbose_name': '\u8001\u5e08\u5bc4\u8bed',
                'verbose_name_plural': '\u8001\u5e08\u5bc4\u8bed',
            },
        ),
    ]