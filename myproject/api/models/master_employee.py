from django.db import models


class master_employee(models.Model):
    employee_id = models.BigAutoField(primary_key=True)
    name = models.CharField(max_length=100)
    address = models.CharField(max_length=300)
    id_type = models.CharField(max_length=100)
    id_number = models.CharField(max_length=100)
    employee_status = models.CharField(max_length=100)
    dob = models.DateField()
    phone_number = models.CharField(max_length=50)

    class Meta:
        db_table = 'MasterEmployee'

    def __str__(self):
        return self.name
