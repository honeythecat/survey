##Survey Maker!
by Dex Fitch and Heather Anderson

A simple web app that lets you make magical surveys, edit your magical surveys, and...wait for it...DELETE EVERYTHING (but the app, unless you're special).

##Setup

In your terminal inside this project folder:

`gem install bundle`

`bundle`

`rake db:create`

`rake db:schema:load`

`ruby app.rb`

Go to http://localhost:4567 in your browser

Enjoy!

##Tests
Testing the ruby methods can be done via rspec.

##Known Bugs
As of latest commit: None

##Motivation

To practice creating a one-to-many database that interacts with the front-end using Rake, ActiveRecord, and shoulda-matchers.

##License

MIT License, copyright 2015 dexfitch Heather Anderson

##Note to future self: Don't forget about deprecated methods and shoulda-matchers, because eventually, you'll want to remember why you lost over an hour of your life.
