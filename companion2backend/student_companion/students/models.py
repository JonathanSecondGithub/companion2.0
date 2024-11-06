from django.db import models

# Create your models here.

class Student(models.Model):
    name = models.CharField(max_length=100)
    student_id = models.CharField(max_length=20, unique=True)
    course = models.CharField(max_length=100)
    year_of_study = models.CharField(max_length=10)
    semester = models.CharField(max_length=10)

    def __str__(self):
        return self.name
