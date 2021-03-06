# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2019-05-11 13:07
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0005_auto_20190423_2255'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacher',
            name='image',
            field=models.ImageField(null=True, upload_to='teacher/', verbose_name='\u8bb2\u5e08\u5934\u50cf'),
        ),
        migrations.AlterField(
            model_name='courseorg',
            name='image',
            field=models.ImageField(upload_to='course/%Y/%m', verbose_name='LOGO'),
        ),
    ]
