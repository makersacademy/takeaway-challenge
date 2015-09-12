```
What is a ruby gem? Give a code example showing how to use a ruby gem in a piece of code. What are some dangers to using a gem?
```

From Wikipedia,

_RubyGems is a package manager for the Ruby programming language that provides a standard format for distributing Ruby programs and libraries (in a self-contained format called a "gem"), a tool designed to easily manage the installation of gems, and a server for distributing them. RubyGems was created in about November 2003 and is now part of the standard library from Ruby version 1.9._

## Use on the command line
If you're familiar with the package managers `yum` and `apt` (Aptitude) common on Linux platforms,  it's easy to understand the commands that you might use with `gem`.

For example, `apt-get [un]install [package]` becomes `gem [un]install [package]` and `apt --installed list` becomes `gem list --local`.

## Anatomy of a gem

From [rubygems.org](http://guides.rubygems.org/what-is-a-gem/),

_Each gem follows the same standard structure of code organization:_

```
% tree freewill
freewill/
├── bin/
│   └── freewill
├── lib/
│   └── freewill.rb
├── test/
│   └── test_freewill.rb
├── README
├── Rakefile
└── freewill.gemspec
```

_Here, you can see the major components of a gem:_

_* The `lib` directory contains the code for the gem
* The `test` or `spec` directory contains tests, depending on which test framework the developer uses
* A gem usually has a `Rakefile`, which the rake program uses to automate tests, generate code, and perform other tasks.
* This gem also includes an executable file in the bin directory, which will be loaded into the user’s PATH when the gem is installed.
* Documentation is usually included in the `README` and inline with the code. When you install a gem, documentation is generated automatically for you. Most gems include RDoc documentation, but some use YARD docs instead.
* The final piece is the `gemspec`, which contains information about the gem. The gem’s files, test information, platform, version number and more are all laid out here along with the author’s email and name._

## Using ruby gems in ruby code

Gems are included in ruby code using `require`. Here is a real code example of me using the Twilio gem to send an SMS. I ran `gem install twilio-ruby` and then used it like this,

```
require 'twilio-ruby'

# put your own credentials here, get them at twilio.com
account_sid = 'ACd4eb490c9e717cb696cef8f767f70f8c'
auth_token = 'imnotgivingyouthat!'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.messages.create(
  from: '+441497870043',
  to: '+44myphonenumberimnotgivingyouthat!',
  body: 'Hey there!'
)
```

