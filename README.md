# [Hacker Notes](http://www.thehackernotes.com)
{{ An active README for Open Source projects on Github }}

## Credits
Thanks to **Mavenhvie** team for being a indispensable support to this project since the inception of the idea.  
[Mavenhive](http://www.mavenhive.in/) Team - [Jake](https://twitter.com/anandhak), [DP](https://twitter.com/codemangler), [Bhavin](https://twitter.com/bhavinjavia)  

## Setup
Add `export JIMMY=YOUR-GITHUB-USERNAME`  
After doing this you should login using your Github account. (if you fail to this no resources data will be persisted)

## Gotcha
1. All the data initially in the application is added by Jimmy, this user gets created when Jimmy first time signs-in.
If jimmy has not signed in (does not exist in DB), the data validation fails and no resource gets added to database.

2. rake:drop will drop the database user - you will need to login to mongohq and add user again.

## Contribution
Excuse me for no documentation or if you are having problem with the setup. Will update README and documentation around that as the time permits.  
Your are more than welcome to contribute to the project.
