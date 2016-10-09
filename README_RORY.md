"I spent a couple of hours planning this project before writing any code. Before the planning I had an issue where after installing a new version of Ruby I couldn't load any of my gems. RVM seemed to be looking in the system Library of Ruby 2.0.0. I reinstalled Bundler and all gems worked after that. It seems every day starts off with a bug fix and a learning experience on command line and mac file structure. I drew up a domain model displaying responsibilities and created the user story diagrams. It seems too simple, expecting the challenge to get much harder halfway through when I encounter Twilio."

I'm spending a lot of time looking for the rspec matcher that does what I need for the situation. Frustrating as it's not an issue with understanding rspec syntax or how to use it, it's simply that the documentation is poor and the internet is full of the old syntax. Trying to do simple test: whether a method returns an array.

Mistakes I have made so far that have cost me a significant amount of time:

def initialise instead of def initialize

didn't use my do/end block

:list_menu instead of takeaway.list_menu

expect(takeaway.array).to be_an_array
and/or
expect(takeaway.menu).to be_kind_of(Array)
instead of
expect(takeaway.array).to eq []
(first two seem like they really should work...)
UPDATE
This only worked with my empty test array. When applied to a not empty array it failed. error: 'expected to respond to `array?`'

QUESTIONS

How do I test whether a hash contains  a key rather than key value pairs?
