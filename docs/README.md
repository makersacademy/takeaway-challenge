Title of project
################

Takeaway Challenge - the aim of this project is to generate code to address 4 user stories - see https://github.com/makersacademy/takeaway-challenge

Author
######

The README.md, files, code and tests were prepared by Makers Academy (Sam Morgan/Leo).

Requirements
############

This project requires the following Ruby version:

source 'https://rubygems.org'
ruby '2.2.3'

This project requires the following Ruby gems:

gem 'rake'
gem 'rspec'
gem 'coveralls', require: false
gem 'capybara'
gem 'twilio-ruby', '~> 4.2.1'
gem 'rubocop', '~> 0.36.0', require: false

Installation
############

Rspec is installed by following the content in this link: https://github.com/rspec/rspec-rails

This Takeaway Challenge repo is cloned from: https://github.com/makersacademy/takeaway-challenge.git

Configuration
#############

The module has no menu or modifiable settings. There is no configuration.

Project Directories
###################

->doc directory - contains README.md and review.md
->lib directory - contains code 
->spec directory - contains rspec tests

IRB demo of app - User perspective
##################################

2.2.3 :001 > require './lib/takeaway'
 => true 
2.2.3 :002 > takeaway = Takeaway.new(@menu)
 => #<Takeaway:0x007fdb73197980 @menu=nil> 

REPLACE WITH EF CODE!

2.2.3 :001 > t = TakeAway.new
 => #<TakeAway:0x007f975b1a39a8 @menu=#<Menu:0x007f975b1a3890 @dishes={"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}>, @basket={}, @text_provider=#<TwilioAPI:0x007f975b1a33e0>>
2.2.3 :002 > t.read_menu
 => {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
2.2.3 :003 > t.order 'spring roll'
 => "1x spring roll(s) added to your basket."
2.2.3 :004 > t.order 'spring roll'
 => "1x spring roll(s) added to your basket."
2.2.3 :005 > t.order 'spring roll', 4
 => "4x spring roll(s) added to your basket."
2.2.3 :006 > t.basket_summary
 => "spring roll x4 = £3.96"
2.2.3 :007 > t.add 'pork dumpling', 3
 => "3x pork dumpling(s) added to your basket."
2.2.3 :008 > t.basket_summary
 => "spring roll x4 = £3.96, pork dumpling x3 = £8.97"
2.2.3 :009 > t.total
 => "Total: £12.93"
2.2.3 :010 > c.checkout(12.93)

Code status
###########

WIP

Copyright and Licensing
#######################

Copyright(c) 2016 Elaine Finn

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.