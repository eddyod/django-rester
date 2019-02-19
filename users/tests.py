from django.urls import reverse
from rest_framework.test import APITestCase
#from django.contrib.auth.models import User
#from .models import UserSite
from users.models import User
from sites.models import Site
from rest_framework import status

class AccountsTest(APITestCase):
    def setUp(self):
        # We want to go ahead and originally create a user. 
        self.test_user = User.objects.create_user(email='foobar@example.com', password='testpassword', first_name='Joe', last_name = 'Lname')
        self.assertEqual(User.objects.count(), 1)
        # URL for creating an account.
        self.create_url = reverse('account-create')

    def test_create_site(self):
        """
        Ensure we can create a new site which auto adds user site.
        """
        data = {
            'name': 'Site Test 1',
            'created': '2018-12-14',
            'active': '1',
            'owner': 1,
        }
        
        user = User.objects.get(id=1)
        ####self.assertEqual(user.company, None)
        
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(Site.objects.count(), 0)
        #self.assertEqual(UserSite.objects.count(), 0)
        self.create_url = reverse('site-create', args=[1])
        response = self.client.post(self.create_url , data, format='json')
        # Additionally, we want to return the username and email upon successful creation.
        self.assertEqual(response.data['name'], data['name'])

        # We want to make sure we have one site in the database..
        self.assertEqual(Site.objects.count(), 1)
        # We want to make sure site_id got updated in user
        user = User.objects.get(id=1)
        #####self.assertEqual(user.company, data['owner'])
        site = Site.objects.get(id=1)
        self.assertEqual(user.site.id, site.id)
        # And that we're returning a 201 created code.
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)


    def test_create_user(self):
        """
        Ensure we can create a new user and a valid token is created with it.
        """
        data = {
            'first_name': 'Joe First',
            'last_name': 'Joe Last',
            'is_staff': '1',
            'email': 'different@example.com',
            'password': 'somepassword'
        }
        # test to make sure 1st user is in
        self.assertEqual(User.objects.count(), 1)
        
        response = self.client.post(self.create_url , data, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        # Additionally, we want to return the username and email upon successful creation.
        self.assertEqual(response.data['email'], data['email'])
        self.assertFalse('password' in response.data)

        # We want to make sure we have two users in the database..
        self.assertEqual(User.objects.count(), 2)
        # And that we're returning a 201 created code.
        # Additionally, we want to return the username and email upon successful creation.
        self.assertEqual(response.data['email'], data['email'])
        self.assertFalse('password' in response.data)

    def test_create_user_with_short_password(self):
        """
        Ensure user is not created for password lengths less than 8.
        """
        data = {
            'first_name': 'Joe First',
            'last_name': 'Joe Last',
                'email': 'foobarbaz@example.com',
                'password': 'foo'
        }

        response = self.client.post(self.create_url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(len(response.data['password']), 1)

    def test_create_user_with_no_password(self):
        data = {
            'first_name': 'Joe First',
            'last_name': 'Joe Last',
                'email': 'foobarbaz@example.com',
                'password': ''
        }

        response = self.client.post(self.create_url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(len(response.data['password']), 1)

    def test_create_user_with_empty_first_name(self):
        data = {
            'first_name': '',
            'last_name': 'Joe Last',
                'email': 'foobarbaz@example.com',
                'password': 'sdfsdfsfe'
        }

        response = self.client.post(self.create_url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(len(response.data['first_name']), 1)

    def test_create_user_with_NULL_first_name(self):
        data = {
            'first_name': None,
            'last_name': 'Lname',
            'email': 'foobar@example.com',
            'password': 'asdfasdfasdf354'
        }

        response = self.client.post(self.create_url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(len(response.data['first_name']), 1)

    def test_create_user_with_empty_last_name(self):
        data = {
            'first_name': 'joe',
            'last_name': '',
                'email': 'foobarbaz@example.com',
                'password': 'asdfksjldkj'
        }

        response = self.client.post(self.create_url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(len(response.data['last_name']), 1)

    def test_create_user_with_NULL_last_name(self):
        data = {
            'first_name': 'sdfsf',
            'last_name': None,
                'email': 'foobarbaz@example.com',
                'password': 'sldkjflskjdflskjd'
        }

        response = self.client.post(self.create_url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(len(response.data['last_name']), 1)

    def test_create_user_with_too_long_email(self):
        data = {
            'first_name': 'Joe First',
            'last_name': 'Joe Last',
            'email': 'foobarbazxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx@example.com',
            'password': 'foobar'
        }

        response = self.client.post(self.create_url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.count(), 1)
        #self.assertEqual(len(response.data['email']), 1)

    def test_create_user_with_no_email(self):
        data = {
            'first_name': 'Joe First',
            'last_name': 'Joe Last',
                'email': '',
                'password': 'foobar'
                }

        response = self.client.post(self.create_url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(len(response.data['email']), 1)


    def test_create_user_with_preexisting_email(self):
        data = {
            'first_name': 'Joe First',
            'last_name': 'Joe Last',
            'email': 'foobar@example.com',
            'password': 'testuser'
        }

        response = self.client.post(self.create_url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(len(response.data['email']), 1)

    def test_create_user_with_invalid_email(self):
        data = {
            'first_name': 'Joe First',
            'last_name': 'Joe Last',
            'email':  'testing',
            'passsword': 'foobarbaz'
        }


        response = self.client.post(self.create_url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(len(response.data['email']), 1)

    def test_create_user_with_no_email(self):
        data = {
            'first_name': 'Joe First',
            'last_name': 'Joe Last',
                'email': '',
                'password': 'foobarbaz'
        }

        response = self.client.post(self.create_url, data, format='json')
        self.assertEqual(response.status_code, status.HTTP_400_BAD_REQUEST)
        self.assertEqual(User.objects.count(), 1)
        self.assertEqual(len(response.data['email']), 1)

