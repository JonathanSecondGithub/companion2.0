from django.contrib.auth.models import User
from rest_framework import serializers
from .models import Student

class StudentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Student
        fields = '__all__'

class RegisterSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    # Additional fields for the Student model
    name = serializers.CharField(write_only=True)
    student_id = serializers.CharField(write_only=True)
    course = serializers.CharField(write_only=True)
    year_of_study = serializers.IntegerField(write_only=True)
    semester = serializers.IntegerField(write_only=True)

    class Meta:
        model = User
        fields = ['username', 'password', 'name', 'student_id', 'course', 'year_of_study', 'semester']
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        # user = User.objects.create_user(
        #     username=validated_data['username'],
        #     password=validated_data['password'],
        #     #email=validated_data['email'],
        # )
        # return user

        # Extract the additional fields
        name = validated_data.pop('name')
        student_id = validated_data.pop('student_id')
        course = validated_data.pop('course')
        year_of_study = validated_data.pop('year_of_study')
        semester = validated_data.pop('semester')

        # Create the User object
        user = User.objects.create_user(username=validated_data['username'], password=validated_data['password'])

        # Create the Student object linked to the User
        Student.objects.create(
            user=user,
            name=name,
            student_id=student_id,
            course=course,
            year_of_study=year_of_study,
            semester=semester
        )

        return user
