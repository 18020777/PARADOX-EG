from django.shortcuts import render

from pegapp import models as m


# from . import forms


def home(request):
    scenarios = m.Scenario.objects.all()
    return render(request, 'theme/home.html', {'scenarios': scenarios})


def scenario_detail(request, scn_id):
    scenarios = m.Scenario.objects.all()
    this_scenario = m.Scenario.objects.get(id=scn_id)
    return render(request, 'theme/scenario.html', {'scenarios': scenarios, 'this_scenario': this_scenario})
