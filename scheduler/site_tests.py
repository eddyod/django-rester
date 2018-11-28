from django.urls import reverse
from rest_framework.test import APITestCase
from .models import Site, User
from rest_framework import status

class AccountsTest(APITestCase):
    def setUp(self):
        ## need key from user first
        # We want to go ahead and originally create a user. 
        self.test_user = User.objects.create_user('testuser', 'test@example.com', 'testpassword')
        # URL for creating an account.
        self.create_url = reverse('account-create')

        
        
        # We want to go ahead and originally create a site. 
        self.test_site = Site.objects.create(name='Test Name',email='joe@foobar.com', active='1', owner=self.test_user, created='2018-10-13')

        # URL for creating an account.
        self.create_url = reverse('site-create')

    def test_create_site(self):
        self.assertEqual(Site.objects.count(), 1)
        data = {
            'name': 'Joe First',
            'email': 'foobar@example.com',
            'active': '1',
            'owner': '1',
            'created': '2018-10-14'
        }

        response = self.client.post(self.create_url , data, format='json')

        # We want to make sure we have two sites in the database..
        self.assertEqual(Site.objects.count(), 2)
        # And that we're returning a 201 created code.
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        # Additionally, we want to return the sitename and email upon successful creation.
        self.assertEqual(response.data['name'], data['name'])
        self.assertEqual(response.data['email'], data['email'])

