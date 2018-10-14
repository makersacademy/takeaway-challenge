# Take Away Challenge

Take Away Challenge for Makers

## Approach

I tried to follow the single responsibility and the dependecy inversion principle.


I created the view classes that are responsible for how the data get displayed, I created the factory classes that create menu or order objects from external data. 


I used the twilio service to send a confirmation sms with delivery time.


I used TDD to develop the project, have 100% test coverage and 0 rubocop warnings.

## Run

```ruby
takeaway = Takeaway.new
takeaway.display_menu
takeaway.place_order([['Yasai Gyoza', 1], ['Duck Donburi', 1]])
takeaway.display_order
puts 'Type the phone number, including +44'
takeaway.confirm_order(9, gets.chomp)
```
(The sms function only works with my own phone number.)