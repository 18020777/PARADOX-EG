from django.conf import settings
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.views.generic import View
from pegapp import forms as f
from pegapp import models as m


def home(request):
    scenarios = m.Scenario.objects.all()
    context = {'scenarios': scenarios}
    return render(request, 'pegapp/home.html', context)


def scenario_detail(request, scn_id):
    scenarios = m.Scenario.objects.all()
    this_scenario = m.Scenario.objects.get(id=scn_id)
    gallery = m.Image.objects.filter(scenario__id=scn_id)
    context = {'scenarios': scenarios, 'this_scenario': this_scenario, 'gallery': gallery}
    return render(request, 'pegapp/scenario.html', context)


@login_required
def account(request):
    scenarios = m.Scenario.objects.all()
    user = request.user
    context = {'scenarios': scenarios, 'user': user}
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
