# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2019-06-09 00:38
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0009_video_course'),
    ]

    operations = [
        migrations.AddField(
            model_name='lesson',
            name='mins',
            field=models.CharField(default='10:00', max_length=10, verbose_name='\u65f6\u957f'),
        ),
    ]
