# -*- coding: utf-8 -*-
"""
Middleware to force Polish language for all users
"""
from django.utils import translation


class ForcePolishLanguageMiddleware:
    """
    Middleware that forces Polish language for all requests.
    This overrides the browser's Accept-Language header.
    """
    
    def __init__(self, get_response):
        self.get_response = get_response
    
    def __call__(self, request):
        # Force Polish language for all requests
        translation.activate('pl')
        request.LANGUAGE_CODE = 'pl'
        
        response = self.get_response(request)
        return response
