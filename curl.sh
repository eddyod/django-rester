#curl -X POST -H 'Content-Type:application/json' http://192.168.1.12:8000/api/sites \
#-d '{ "name": "Joe First", "email": "foobar@example.com", "active": "1", "owner": "1", "created": "2018-10-14"}'

curl -X POST -H 'Content-Type:application/json' http://192.168.1.12:8000/api/user_sites -d '{ "site": "1", "user_id": "1"}'

                                                                    "

