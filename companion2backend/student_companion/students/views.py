from django.shortcuts import render
from rest_framework import viewsets
from .models import Student
from .serializers import StudentSerializer
from django.contrib.auth import authenticate
from django.http import JsonResponse

from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from django.contrib.auth.models import User
from rest_framework_simplejwt.tokens import RefreshToken
from .serializers import RegisterSerializer  # create a serializer for registration

from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response

from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import permission_classes

# Create your views here.
class StudentViewSet(viewsets.ModelViewSet):
    queryset = Student.objects.all()
    serializer_class = StudentSerializer



class RegisterView(generics.CreateAPIView):
    queryset = User.objects.all()
    permission_classes = (AllowAny,)
    serializer_class = RegisterSerializer

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        refresh = RefreshToken.for_user(user)
        return Response({
            'refresh': str(refresh),
            'access': str(refresh.access_token),
        }, status=status.HTTP_201_CREATED)
    
def login_view(request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    
    user = authenticate(username=username, password=password)
    if user is None:
        # Check if user exists
        if not User.objects.filter(username=username).exists():
            return JsonResponse({'error': 'User does not exist'}, status=404)
        else:
            return JsonResponse({'error': 'Incorrect password'}, status=401)
    
    # If authentication succeeds
    return JsonResponse({'message': 'Login successful'}, status=200)

@api_view(['POST'])
def register_user(request):
    if request.method == 'POST':
        # Deserialize the incoming data
        serializer = RegisterSerializer(data=request.data)
        
        if serializer.is_valid():
            # Save the new user
            user = serializer.save()
            return Response({
                'message': 'User registered successfully!',
                'user': {
                    'username': user.username,
                    'password': user.password
                }
            }, status=status.HTTP_201_CREATED)
        else:
            # Return error messages if the validation failed
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# get user details        
@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_user_details(request):
    try:
        # Retrieve the student details for the authenticated user
        student = Student.objects.get(user=request.user)
        serializer = StudentSerializer(student)
        return Response(serializer.data, status=status.HTTP_200_OK)
    except Student.DoesNotExist:
        return Response({"error": "Student details not found."}, status=status.HTTP_404_NOT_FOUND)
