from django import forms
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserCreationForm
from pegapp import models as m


class LoginForm(forms.Form):
    username = forms.CharField(max_length=63, label="Nom d’utilisateur")
    password = forms.CharField(max_length=63, widget=forms.PasswordInput, label="Mot de passe")


class SignUpForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model = get_user_model()
        fields = ('username', 'email', 'first_name', 'last_name')


class BookingForm(forms.Form):
    time_choices = [(str(i), f'{i}:00') for i in range(10, 13)] + [(str(i), f'{i}:00') for i in
                                                                   range(14, 19)]
    scenario = forms.ModelChoiceField(queryset=m.Scenario.objects.all())
    date_booking = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    time_booking = forms.ChoiceField(choices=time_choices)
    nb_players = forms.IntegerField()
