# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2019-05-27 21:14
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('operation', '0004_userfavorite_course'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='userfavorite',
            name='course',
        ),
    ]
