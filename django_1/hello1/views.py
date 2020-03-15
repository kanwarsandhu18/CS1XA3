from django.shortcuts import render
from django.http import HttpResponse
def hello(request):
        html = "<html> <body> HEllo World </body> </html>"
        return HttpResponse(html)
#def goodbye(request):
#	html = "<html> <body> goodbye world </body> </html>"
#        return HttpResponse(html)
