from django.contrib.auth import login, authenticate
from django.shortcuts import render, redirect
from django.views.generic import View
from pegapp import forms as f
from pegapp import models as m


# from . import forms


def home(request):
    scenarios = m.Scenario.objects.all()
    return render(request, 'pegapp/home.html', {'scenarios': scenarios})


def scenario_detail(request, scn_id):
    scenarios = m.Scenario.objects.all()
    this_scenario = m.Scenario.objects.get(id=scn_id)
    gallery = m.Image.objects.filter(scenario__id=scn_id)
    return render(request, 'pegapp/scenario.html',
                  {'scenarios': scenarios, 'this_scenario': this_scenario, 'gallery': gallery})


class LoginPage(View):
    scenarios = m.Scenario.objects.all()
    form_class = f.LoginForm
    template_name = 'pegapp/login.html'

    def get(self, request):
        form = self.form_class
        message = ''
        return render(request, self.template_name,
                      context={'scenarios': self.scenarios, 'form': form, 'message': message})

    def post(self, request):
        form = self.form_class(request.POST)
        message = ''
        if form.is_valid():
            user = authenticate(
                username=form.cleaned_data['username'],
                password=form.cleaned_data['password'],
            )
            if user is not None:
                login(request, user)
                return redirect('home')
            else:
                message = 'Identifiants invalides.'
        return render(request, self.template_name,
                      context={'scenarios': self.scenarios, 'form': form, 'message': message})
