from django.shortcuts import render
from pegapp import models as mo


def base(request):
    scenarios = mo.Scenario.objects.all()
    return render(request, 'theme/home.html', {'scenarios': scenarios})
