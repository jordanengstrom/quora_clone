from django.conf import settings
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic.base import TemplateView


class IndexTemplateView(LoginRequiredMixin, TemplateView):

    def get_template_names(self):
        if settings.DEBUG is False:
            template_name = 'index-prod.html'
        else:
            template_name = 'index-dev.html'
        return template_name
