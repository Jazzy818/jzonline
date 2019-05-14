# -*- coding: utf-8 -*-
from __future__ import unicode_literals

import django
from django.contrib.auth.hashers import make_password
from django.db.models import Q
from django.contrib.auth import authenticate, login
from django.contrib.auth.backends import ModelBackend
from django.http import HttpResponse
from django.shortcuts import render

# Create your views here.
from django.views.generic import View

from operation.models import UserFavorite
from users.forms import LoginForm, RegisterForm, ForgetpwdForm, ModifyPwdForm
from users.models import UserProfile, EmailVerifyRecord
from utils.email_send import send_register_email


class CustomBackends(ModelBackend):
    #这个方法会被django自动调用
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LoginView(View):
    def get(self, request):
       return render(request, "login.html", {})

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user_name = request.POST.get("username", "")
            pass_word = request.POST.get("password", "")
            user = authenticate(username=user_name, password=pass_word)  # 向数据库发起验证，没有登录动作
            if user is not None:
                if user.is_active:
                    django.contrib.auth.login(request, user)  # 登录动作，塞入usersession
                else:
                    return render(request, "login.html", {"msg": "请到用户邮箱激活账号"})
                return render(request, "index.html")
            else:
                return render(request, "login.html", {"msg": "用户名或密码错误"})
        else:
            return render(request, "login.html", {"login_form": login_form})


class RegisterView(View):

    def get(self, request):
        register_form = RegisterForm()
        return render(request, "register.html", {'register_form': register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get("email", "")
            if UserProfile.objects.filter(email=user_name):
                return render(request, "register.html", {'register_form': register_form, "msg": "角色已存在"})
            pass_word = request.POST.get("password", "")
            user_profile = UserProfile()
            user_profile.username = user_name
            user_profile.email = user_name
            user_profile.is_active = False
            user_profile.password = make_password(pass_word) #加密
            user_profile.save()
            send_register_email(user_name, "register")
            return render(request, "login.html")
        else:
            return render(request,"register.html", {'register_form': register_form})


class ActiveCodeView(View):
    def get(self, request, active_code):
        email_records = EmailVerifyRecord.objects.filter(code=active_code)
        if email_records:
            for record in email_records:
                user = UserProfile.objects.get(email=record.email)
                user.is_active = True
                user.save()
        else:
            return render(request, "active_fail.html")
        return render(request, "login.html")


class ForgetPwdView(View):
    def get(self, request):
        forget_form = ForgetpwdForm()
        return render(request, "forgetpwd.html", {"forget_form": forget_form})

    def post(self, request):
        forget_form = ForgetpwdForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get("email","")
            send_register_email(email, "forget")
            return render(request, "send_success.html")
        else:
            return render(request, "forgetpwd.html", {'forget_form': forget_form})


class ResetView(View):
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for record in all_records:
                email = record.email
                return  render(request,"password_reset.html", {"email": email})
        else:
            return render(request, "active_fail.html")
        return render(request, "login.html")


class ModifyView(View):

    def post(self,request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1","")
            pwd2 = request.POST.get("password2","")
            email = request.POST.get("email","")
            if pwd1!= pwd2:
                return render(request, "password_reset.html", {"email": email, "msg": u"密码不一致"})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd2)
            user.save()
            return render(request, "login.html")
        else:
            return render(request, "password_reset.html", {"modify_form": modify_form})


class UserFavView(View):
    '''用户收藏和取消'''
    def post(self, request):
        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)
        if not request.uesr.is_authenticated():
            return HttpResponse('{"status“":"fail","msg":"用户未登录"}', contentType='application/json')
        exist_record = UserFavorite.objects.filter(user=request, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_record:
            #存在记录则取消
            exist_record.delete()
            return HttpResponse('{"status":"fail","msg":"收藏"}', content_type="application.json")
        else:
            user_fav =UserFavorite()
            if int(fav_id)>0 and int(fav_type)>0:
                user_fav.fav_type = fav_type
                user_fav.fav_id = fav_id
                user_fav.save()
                return HttpResponse('{"status":"success","msg":"已收藏"}', content_type="application.json")
            else:
                return HttpResponse('{"status":"fail","msg":"收藏出错"}', content_type="application.json")
        pass;
