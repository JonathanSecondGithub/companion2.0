from rest_framework.routers import DefaultRouter
from django.urls import path, include
from .views import StudentViewSet

from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from . import views  # create views for registration if not present


router = DefaultRouter()
router.register(r'students', StudentViewSet)

urlpatterns = router.urls

urlpatterns = [
    path('api/register/', views.RegisterView.as_view(), name='register'),
    path('api/login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]

