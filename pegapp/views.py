from datetime import timedelta

from django.conf import settings
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.shortcuts import render, redirect, get_object_or_404
from django.views.generic import View

from pegapp import forms as f
from pegapp import models as m


def home(request):
    scenarios = m.Scenario.objects.all()
    try:
        prices_list = m.PricesList.objects.get(id=1)
    except ObjectDoesNotExist:
        prices_list = {}
    context = {'scenarios': scenarios, 'prices_list': prices_list}
    return render(request, 'pegapp/home.html', context)


def scenario_detail(request, scn_id):
    scenarios = m.Scenario.objects.all()
    this_scenario = get_object_or_404(m.Scenario, id=scn_id)
    gallery = m.Image.objects.filter(scenario__id=scn_id)
    score_list = m.Booking.objects.filter(scenario=this_scenario).exclude(chrono=timedelta(0)).exclude(
        chrono=None).order_by('chrono')
    if not score_list:
        best_score = "Aucun"
    else:
        best_score = score_list[0].chrono
    context = {'scenarios': scenarios, 'this_scenario': this_scenario, 'gallery': gallery, 'best_score': best_score}
    return render(request, 'pegapp/scenario.html', context)


def faq(request):
    scenarios = m.Scenario.objects.all()
    faq_elements = m.FAQElement.objects.all()
    context = {'scenarios': scenarios, 'faq_elements': faq_elements}
    return render(request, 'pegapp/faq.html', context)


@login_required
def account(request):
    scenarios = m.Scenario.objects.all()
    user = request.user
    bookings = m.Booking.objects.filter(user=user)
    context = {'scenarios': scenarios, 'user': user, 'bookings': bookings}
    return render(request, 'pegapp/account.html', context)


def logout_user(request):
    logout(request)
    return redirect('home')


class LoginPage(View):
    scenarios = m.Scenario.objects.all()
    form_class = f.LoginForm
    template_name = 'pegapp/login.html'
    message = ''

    def get(self, request):
        form = self.form_class
        context = {'scenarios': self.scenarios, 'form': form, 'message': self.message}
        return render(request, self.template_name, context)

    def post(self, request):
        form = self.form_class(request.POST)
        if form.is_valid():
            user = authenticate(
                username=form.cleaned_data['username'],
                password=form.cleaned_data['password'],
            )
            if user is not None:
                login(request, user)
                return redirect(settings.LOGIN_REDIRECT_URL)
            else:
                self.message = 'Identifiants invalides.'
        context = {'scenarios': self.scenarios, 'form': form, 'message': self.message}
        return render(request, self.template_name, context)


class SignUpPage(View):
    scenarios = m.Scenario.objects.all()
    form_class = f.SignUpForm
    template_name = 'pegapp/signup.html'
    message = ''

    def get(self, request):
        form = self.form_class
        context = {'scenarios': self.scenarios, 'form': form, 'message': self.message}
        return render(request, self.template_name, context)

    def post(self, request):
        form = self.form_class(request.POST)
        if form.is_valid():
            user = form.save()
            # auto-login user
            login(request, user)
            return redirect(settings.LOGIN_REDIRECT_URL)
        else:
            self.message = 'Vérifier le formulaire, certaines informations sont invalides.'
        context = {'scenarios': self.scenarios, 'form': form, 'message': self.message}
        return render(request, self.template_name, context)


class BookingPage(View):
    scenarios = m.Scenario.objects.all()
    form_class = f.BookingForm
    template_name = 'pegapp/booking.html'
    message = ''

    def get(self, request, scenario_id=0):
        if scenario_id:
            scenario = m.Scenario.objects.get(id=scenario_id)
            form = self.form_class(initial={'scenario': scenario})
        else:
            form = self.form_class
        context = {'scenarios': self.scenarios, 'form': form, 'message': self.message}
        return render(request, self.template_name, context)

    def post(self, request):
        form = self.form_class(request.POST, user=request.user)
        if form.is_valid():
            form.save()
            return redirect('account')
        else:
            self.message = "Vérifier le formulaire, certaines informations sont invalides."
        context = {'scenarios': self.scenarios, 'form': form, 'message': self.message}
        return render(request, self.template_name, context)
