from django.contrib import admin
from django.urls import path, include
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
    TokenVerifyView
)



urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('core.urls')),
    path('', include('intranet.urls')),
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),

    ## Autenticación
    #path('api/auth/login/', LoginView.as_view(), name='login'),
    #path('api/auth/register/', RegisterView.as_view(), name='register'),
    #path('api/auth/forgot-password/', ForgotPasswordView.as_view(), name='forgot_password'),
    #path('api/auth/reset-password/', ResetPasswordView.as_view(), name='reset_password'),
    #path('api/auth/profile/', ProfileView.as_view(), name='profile'),
    #
    ## JWT
    #path('api/auth/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    #path('api/auth/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
    
    # API
    #path('api/empresas/', include('core.urls.empresa')),
    #path('api/geografia/', include('core.urls.geografia')),
    
    # Frontend
    #path('front/', include('core.urls.frontend')),
]