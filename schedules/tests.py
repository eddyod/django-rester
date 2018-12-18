from django.urls import reverse
from rest_framework.test import APITestCase
from rest_framework import status

class MyApiTest(APITestCase):
    def setUp(self):
        # We want to go ahead and originally create a user. 
        self.test_user = User.objects.create_user(username='testuser', email='test@example.com', password='testpassword', first_name='Joe', last_name = 'Lname', is_staff=1 )
        # URL for creating an account.
        self.create_url = reverse('account-create')
        self.assertEqual(User.objects.count(), 1)
