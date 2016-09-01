# Take-away Code Review Notes

* They never asked for a user interface class - don't do more than you need to fulfil

## Single Responsibility Principle:

* Don't use presentation logic in your code - e.g. `gets` or `puts`
* Don't mix presentation in your 'business logic'
* Injecting double instead of actual class

## For builds failing:
  * Try to get tests passing before making pull requests and/or commits (when working on your own)
  * Look in pull requests
  * Green ticks or red crosses (build is failing)
    * Look at bottom - do all tests pass? Were there any conflicts with the base branch when pulling?
    * Click on 'Details' link in that box
      * Given a report of what's happening
    * When everything passes, automatically is deployed to program you're adding to
    * If something's failing, won't be automatically deployed
    * Sometimes things work on one machine and not on another
      * Could be using different environment variables or gems

## Misc. Points:

* Don't use `respond_to` for tests anymore
* Stub your gem (twilio)
* Use `any_instance_of` in rspec instead of doubling an instance of a double
* How do you test for an interface file?
  * Coveralls report - should only test your lib files, not your spec files - if happens, most likely a configuration problem.
* Always make `attr_reader`s private + try to write methods instead of using lots of `attr_reader`s - otherwise you'll have lots of chained methods:
* Test coveralls report by running `coveralls report` in `irb`

### Example:

Don't do this:
```ruby
# Don't use initialize and attr_reader:
class Client
  attr_reader :messages
  def initialize
    @messages
  end
# Do this instead: - law of demeter (fine to have chain of methods as long as they're being called on only one object)
  def create_message
    @messages.create
  end
end
```

If there is no twilio client, won't use it:

```ruby
def initialize(Twilio::REST::Client=nil)
  @client ||= Twilio::REST::Client.new
end
```
