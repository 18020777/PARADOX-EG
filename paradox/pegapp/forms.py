from datetime import datetime, timezone, timedelta

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


class BookingForm(forms.ModelForm):
    class Meta:
        model = m.Booking
        fields = ['scenario', 'date', 'time', 'num_players']

    # scenario = forms.ModelChoiceField(queryset=m.Scenario.objects.all())
    # date_booking = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
    # time_booking = forms.ChoiceField(choices=TimeChoices().time_choices)
    # nb_players = forms.IntegerField()

    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super().__init__(*args, **kwargs)
        self.fields['date'] = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
        self.fields['date'].widget.attrs['min'] = str(datetime.now(timezone(timedelta(hours=0))).date())
        self.user = user

    def clean_date(self):
        date = self.cleaned_data.get('date')
        if date < datetime.now(timezone.utc).date():
            raise forms.ValidationError("You cannot book a game in the past.", code="pastdate")
        return date

    def clean_time(self):
        time = self.cleaned_data.get('time')
        date = self.cleaned_data.get('date')
        if date == datetime.now(timezone.utc).date() and time <= datetime.now(timezone.utc).time():
            raise forms.ValidationError("It's too late to book at this time.", code="pasttime")
        return time

    def save(self, commit=True):
        instance = super().save(commit=False)
        instance.user = self.user
        if commit:
            instance.save()
        return instance
