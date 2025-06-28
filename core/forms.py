from django import forms
from intranet.models import Opinion, Usuario, Persona, ArchivoFirma,TabTablas,EmpresaSocio
import hashlib
from django import forms
from django.core.exceptions import ValidationError
from django.contrib.auth.hashers import make_password

class EmpresaSocioForm(forms.ModelForm):
    idpersona = forms.ModelChoiceField(queryset=Persona.objects.all(), label="Persona")
    
    class Meta:
        model = EmpresaSocio
        fields = ['idpersona', 'aporte_capital', 'estado']
        widgets = {
            'aporte_capital': forms.NumberInput(attrs={'class': 'form-control'}),
            'estado': forms.NumberInput(attrs={'class': 'form-control'})
        }
        

class ArchivoFirmaForm(forms.ModelForm):
    class Meta:
        model = ArchivoFirma
        fields = ['idarchivo', 'idpersona', 'firma', 'clave_publica']
        widgets = {
            'idarchivo': forms.HiddenInput(),
            'idpersona': forms.HiddenInput(),
        }
class OpinionForm(forms.ModelForm):
    class Meta:
        model = Opinion
        fields = ['tipo', 'titulo', 'descripcion', 'valoracion']
        widgets = {
            'descripcion': forms.Textarea(attrs={'rows': 3}),
            'valoracion': forms.NumberInput(attrs={'min': 1, 'max': 5}),
        }

class PersonaForm(forms.ModelForm):
    class Meta:
        model = Persona
        fields = ['nombres', 'nrodocumento', 'tipo_persona', 'tipodocumento']
        widgets = {
            'tipodocumento': forms.Select(), # Forzar el uso del widget Select
        }
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        # Aquí es donde cargamos las opciones dinámicamente
        self.fields['tipodocumento'].choices = TabTablas.get_choices_for_category(1, solo_activos=True)

class UsuarioForm(forms.ModelForm):
    usuario = forms.CharField(widget=forms.TextInput(attrs={'class': 'form-control with-border', 'placeholder': 'Usuario'}), label="Usuario")
    clave = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control with-border', 'placeholder': 'Clave'}), label="Clave")
    confirm_clave = forms.CharField(widget=forms.PasswordInput(attrs={'class': 'form-control with-border', 'placeholder': 'Repetir clave'}), label="Repetir clave")
    class Meta:
        model = Usuario
        fields = ['usuario', 'clave']

    def clean(self):
        cleaned_data = super().clean()
        clave = cleaned_data.get("clave")
        confirm = cleaned_data.get("confirm_clave")
        if clave != confirm:
            raise ValidationError("Las contraseñas no coinciden.")
        import hashlib
        cleaned_data['clave'] = hashlib.sha256(str(clave).encode('utf-8')).hexdigest()
        return cleaned_data