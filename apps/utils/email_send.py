#-*- coding:utf-8 -*-
from random import Random

from django.core.mail import send_mail

from jzonline.settings import EMAIL_FROM
from users.models import EmailVerifyRecord


def random_str(randomlength=8):
    char = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
    strs = ''
    random = Random()
    lenth = len(char)-1
    for i in range(randomlength):
        strs += char[random.randint(0,lenth)]
    return strs


def send_register_email(email, send_type="register"):
    email_record = EmailVerifyRecord()
    code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    email_title = ""
    emial_body = ""

    if send_type == "register":
        email_title = "江南学堂注册激活链接"
        email_body = "请点击下面的链接激活你的账号：http://127.0.0.1:8000/active/{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == "forget":
        email_title = "江南学堂用户密码重置链接"
        email_body = "请点击下面的链接重置你的密码：http://127.0.0.1:8000/reset/{0}".format(code)
        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass