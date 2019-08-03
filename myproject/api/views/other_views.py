from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from myproject.api.forms import SignUpForm
from myproject.api.models import master_employee


@api_view(['POST'])
def signup(request):
    form = SignUpForm(request.data)
    print(request.data)
    if form.is_valid():
        user = form.save()
        user.refresh_from_db()
        user.master_user.user_level = form.cleaned_data.get('user_level')
        user.master_user.user_type = form.cleaned_data.get('user_type')
        user.master_user.employee_id = master_employee(form.cleaned_data.get('employee_id'))
        user.save()
        return Response("Berhasil membuat account", status=status.HTTP_201_CREATED)
    else:
        return Response(form.errors, status=status.HTTP_400_BAD_REQUEST)
