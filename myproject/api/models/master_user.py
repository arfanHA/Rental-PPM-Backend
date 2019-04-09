from django.db import models
from .master_employee import master_employee


class master_user(models.Model):
    user_id = models.BigAutoField(primary_key=True)
    username = models.CharField(max_length=10, unique=True)
    password = models.CharField(max_length=10)
    user_level = models.CharField(max_length=10)
    user_type = models.CharField(max_length=10)
    last_login_date = models.DateField()
    employee_id = models.OneToOneField(master_employee, on_delete=models.DO_NOTHING, blank=True, default=None)

    class Meta:
        db_table = 'MasterUser'

    def __str__(self):
        return self.username
