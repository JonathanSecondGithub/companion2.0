from django.contrib.auth.models import User
from django.db import models

# Create your models here.

class Student(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)  # Links to Django's User model
    name = models.CharField(max_length=100)
    student_id = models.CharField(max_length=20, unique=True)
    course = models.CharField(max_length=100)
    year_of_study = models.CharField(max_length=10)
    semester = models.CharField(max_length=10)

    def __str__(self):
        return self.name
