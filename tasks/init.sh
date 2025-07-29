# Assign themes only if no other theme exists yet
./manage.py lms shell -c "
import sys
from django.contrib.sites.models import Site
def assign_theme(domain):
    site, _ = Site.objects.get_or_create(domain=domain)
    if not site.themes.exists():
        site.themes.create(theme_dir_name='medical-tribune-indigo')

assign_theme('local.openedx.io')
assign_theme('local.openedx.io')
assign_theme('local.openedx.io:8000')
assign_theme('studio.local.openedx.io')
assign_theme('studio.local.openedx.io:8001')
assign_theme('preview.local.openedx.io')
assign_theme('preview.local.openedx.io:8000')
"