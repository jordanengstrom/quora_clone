from django.urls import include, path
from rest_framework.routers import DefaultRouter
from . import views as qv  # qv = question views


router = DefaultRouter()
router.register(r'questions', qv.QuestionViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path('questions/<slug:slug>/answer/', qv.AnswerCreateAPIView.as_view(), name='answer-create'),
    path('questions/<slug:slug>/answers/', qv.AnswerListAPIView.as_view(), name='answer-list'),
    path('answers/<int:pk>/', qv.AnswerRetrieveUpdateDestroyAPIView.as_view(), name='answer-detail'),
    path('answers/<int:pk>/like/', qv.AnswerLikeAPIView.as_view(), name='answer-like'),
]
