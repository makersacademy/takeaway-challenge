Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

## User Stories ##

 Check userstories.rb for an overview of the various objects I have used to interpret each requirement.

### Getting Started#

run ```$ ruby ./lib/takeaway.rb```.

### Prerequisites

This project requires the Twilio RubyGem [(more info...)](https://www.twilio.com/docs/libraries/ruby).

All prerequisites are available by running the command ```$ bundle```.

You will need to run the command ```$ gem install bundle``` if you don't have bundle already installed.

### Structure ###
    .
    ├── CONTRIBUTING.md
    ├── Gemfile
    ├── Gemfile.lock
    ├── LICENSE
    ├── README.md
    ├── Rakefile
    ├── coverage
    ├── docs
    │   └── review.md
    ├── lib
    │   ├── delivery.rb
    │   ├── menu.rb
    │   ├── order.rb
    │   └── takeaway.rb
    ├── newREADME.md
    ├── spec
    │   ├── delivery_spec.rb
    │   ├── menu_spec.rb
    │   ├── order_spec.rb
    │   ├── spec_helper.rb
    │   └── takeaway_spec.rb
    └── userstories.md

### Development Methodology

This program was built and tested using Test Driven Development

* [Ruby](https://www.ruby-lang.org) - The language used to develop this program - v2.4.0p0 (2016-12-24 revision 57164)
* [Twilio](https://www.twilio.com) - The SMS client used to send delivery notifications - v4.13.0
* [Rspec](http://rspec.info) - The testing framework used to drive development - v3.5.4
