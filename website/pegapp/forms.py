from datetime import datetime, timezone, timedelta

from django import forms
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import UserCreationForm

from pegapp import models as m


class LoginForm(forms.Form):
    username = forms.CharField(max_length=63, label="Nom d’utilisateur")
    password = forms.CharField(max_length=63, widget=forms.PasswordInput, label="Mot de passe")


class SignUpForm(UserCreationForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['password1'].label = 'Mot de passe'
        self.fields['password2'].label = 'Confirmation du mot de passe'
        self.fields['password1'].help_text = '8 caractères minimum.'
        self.fields['password2'].help_text = 'Veuillez entrer le même mot de passe pour confirmation.'

    class Meta(UserCreationForm.Meta):
        model = get_user_model()
        fields = ('username', 'email', 'first_name', 'last_name')
        labels = {
            'username': 'Nom d\'utilisateur',
            'email': 'Adresse e-mail',
            'first_name': 'Prénom',
            'last_name': 'Nom de famille',
        }
        help_texts = {
            'username': 'Choisissez un nom d\'utilisateur (caractères acceptés: lettres, chiffres, et @/./+/-/_).',
        }


class BookingForm(forms.ModelForm):
    class Meta:
        model = m.Booking
        fields = ['scenario', 'date', 'time', 'num_players']

    def __init__(self, *args, **kwargs):
        user = kwargs.pop('user', None)
        super().__init__(*args, **kwargs)
        self.fields['date'] = forms.DateField(widget=forms.DateInput(attrs={'type': 'date'}))
        self.fields['date'].widget.attrs['min'] = str(datetime.now(timezone(timedelta(hours=0))).date())
        self.fields['num_players'].widget.attrs['value'] = 2
        self.fields['num_players'].widget.attrs['min'] = 2
        self.fields['num_players'].widget.attrs['max'] = 10
        self.user = user

    def clean_date(self):
        date = self.cleaned_data.get('date')
        if date < datetime.now(timezone.utc).date():
            raise forms.ValidationError("Vous ne pouvez pas réserver une partie dans le passé!", code="pastdate")
        return date

    def clean_time(self):
        time = self.cleaned_data.get('time')
        date = self.cleaned_data.get('date')
        if date == datetime.now(timezone.utc).date() and time <= datetime.now(timezone.utc).time():
            raise forms.ValidationError("C'est trop tard pour réserver à cette heure-là.", code="pasttime")
        return time

    def save(self, commit=True):
        instance = super().save(commit=False)
        instance.user = self.user
        if commit:
            instance.save()
        return instance
