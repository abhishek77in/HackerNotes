# [Hacker Notes](http://www.hackernotes.org)

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
My [presentation](http://prezi.com/uvj4u2y0k1zg/how-i-built-hacker-notes/) about how I built Hacker Notes at BRUG (Bangalore Ruby User Group) dated 20-Jul-2013, this should give you a basic idea about its architecture and several other things.


## Credits
Thanks to **Mavenhvie** team for being a indispensable support to this project since the inception of the idea.  
[Mavenhive](http://www.mavenhive.in/) Team - [Jake](https://twitter.com/anandhak), [Dharampal](https://twitter.com/codemangler), [Bhavin](https://twitter.com/bhavinjavia)  
