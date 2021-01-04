from django.urls import path, include
from django_email_verification import urls as mail_urls
from users.api.views import CurrentUserAPIView

urlpatterns = [
    path('user/', CurrentUserAPIView.as_view(), name='current-user'),
    path('email/', include(mail_urls)),
]
