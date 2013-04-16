#Hackernotes
{{ Hack to Create }}

##Gotcha
1. All the data initially in the application is added by Jimmy, this user gets created when Jimmy first time signs-in.
If jimmy has not signed in (does not exist in DB), the data validation fails and no resource gets added to database.

2. rake:drop will drop the database user - you will need to login to mongohq and add user again.
