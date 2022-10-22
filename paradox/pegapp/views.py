from django.shortcuts import render

from pegapp import models as m


# from . import forms


def base(request):
    scenarios = m.Image.objects.all()
    return render(request, 'theme/home.html', {'scenarios': scenarios})
