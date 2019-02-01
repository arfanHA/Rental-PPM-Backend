from django.db import models


class master_user(models.Model):
    user_id = models.BigAutoField(primary_key=True)
    username = models.CharField(max_length=10)
    password = models.CharField(max_length=10)
    user_level = models.IntegerField()
    user_type = models.IntegerField()
    last_login_date = models.DateField()

    class Meta:
        db_table = 'MasterUser'

    def __str__(self):
        return self.username
