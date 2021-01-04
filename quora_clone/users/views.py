from django.shortcuts import render
from django.contrib.auth import get_user_model
from django_email_verification import sendConfirm


def myCreateView(request):
    user = get_user_model().objects.create(username=request.username, password=request.password1, email=request.email)
    sendConfirm(user)
    print('made it here')
    return {'new_user_created': True}
