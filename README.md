# [Hacker Notes](http://www.thehackernotes.com)
{{ An active README for Open Source projects on Github }}

## Setup
Clone the repository
Bundle install all the gems
Run mongodb server - Run `mongod` on the terminal
Run `rake db:setup`
Run `bundle exec thin start`
At this point you should be able to access the application from the browser.
Add `export JIMMY=YOUR-GITHUB-USERNAME`  
After doing this you should login using your Github account. (if you fail to this no resources data will be persisted)

## Gotcha
1. All the data initially in the application is added by Jimmy, this user gets created when Jimmy first time signs-in.
If jimmy has not signed in (does not exist in DB), the data validation fails and no resource gets added to database.

## Contribution
If you like the project and wish to improve it please send a mail to abhishek77in[at]gmail.com I will personally help you setup the project.


## Credits
Thanks to **Mavenhvie** team for being a indispensable support to this project since the inception of the idea.  
[Mavenhive](http://www.mavenhive.in/) Team - [Jake](https://twitter.com/anandhak), [Dharampal](https://twitter.com/codemangler), [Bhavin](https://twitter.com/bhavinjavia)  
