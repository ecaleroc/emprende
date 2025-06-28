from .forms import OpinionForm

def opinion_form_global(request):
    return {'form': OpinionForm()}
