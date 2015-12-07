# TakeAway - simple ruby restaurant software.
 A simple ruby program to help you create and manage menus, meals, orders, and sms order confirmation using the TWILIO api.
# Getting Started
 - Create a new folder for this project
 - Fork this repo into a your github profile
 - Run bundle

 ```sh
$ mkdir MyTakeAway
$ cd MyTakeAway
$ git clone github.com/[...YOUR GIT NAME...]/takeaway
$ bundle install
```
 
# Testing 
You now have a copy of this project. Inside the project you will find spec files that you can use to test this program. to do so make sure ruby gem is installed.
```sh
$ gem install rspec
```
 - Navigate to the project folder
 - then run ```$ rspec ```
 
 ```sh
$ cd MyTakeAway
$ rspec
```
# Creating a new Takeaway

Once you have verified the rspec tests are passing and you are now bathing in a glory of green lights.
you can safely assume you can use this takeaway program with relevant ease.

First things first, fire up your IRB:
```sh $ irb
2.2.3 :001 > require './lib/take_away.rb'
 => true 
```
To create a new Takeawy object
```sh
$ new_takeaway = Takeaway.new("Sandys Sandwiches","38","King Street","NW5 4LQ","+555-666")
```
