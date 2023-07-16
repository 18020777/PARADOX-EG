"""paradox URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

from pegapp import views, apiviews

# Ici nous créons notre routeur
router = routers.SimpleRouter()
# Puis lui déclarons une url basée sur le mot clé ‘scenario’ et notre view
# afin que l’url générée soit celle que nous souhaitons ‘/api/scenarios/’
router.register('scenario', apiviews.ScenarioViewset, basename='api_scenario')
router.register('booking', apiviews.BookingViewset, basename='api_booking')
router.register('room', apiviews.RoomViewset, basename='api_room')
router.register('prices', apiviews.PricesViewset, basename='api_prices')

urlpatterns = [
    path('admin/', admin.site.urls),
    path('scenario/<int:scn_id>/', views.scenario_detail, name='scenario_detail'),
    path('login/', views.LoginPage.as_view(), name='login'),
    path('signup/', views.SignUpPage.as_view(), name='signup'),
    path('account/', views.account, name='account'),
    path('logout/', views.logout_user, name='logout'),
    path('book/', views.BookingPage.as_view(), name='book'),
    path('book/<int:scenario_id>/', views.BookingPage.as_view(), name='book'),
    path('faq/', views.faq, name='faq'),
    path('api/token/', apiviews.CustomAuthToken.as_view(), name='api_token_auth'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/', include(router.urls)),
    path('api/availability/', apiviews.AvailabilityView.as_view(), name='api_availability'),
    path('api/is_staff/', apiviews.IsStaffView.as_view(), name='api_is_staff'),
    path('api/is_admin/', apiviews.IsAdminView.as_view(), name='api_is_admin'),
    path('', views.home, name='home'),
]

if settings.DEBUG:
    urlpatterns += static(
        settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
