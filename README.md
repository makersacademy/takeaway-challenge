# Takeaway Challenge

[Exercise instructions are here](takeaway-challenge.md)

## Installation

1. Fork and clone this repo
2. `bundle install`
3. Copy `twilio-config-EXAMPLE` to `twilio-config-PRIVATE` (the latter is protected by `.gitignore`)
4. Enter your Twilio credentials and phone numbers in `twilio-config-PRIVATE`

## Instructions

Load Twilio credentials: `source ./twilio-config-PRIVATE`. Then:

```ruby
➜ irb -r ./lib/takeaway.rb      
2.5.0 :001 > t = Takeaway.new
 => #<Takeaway...> 
2.5.0 :002 > t.menu
 => [{:name=>"Mixed Meze", :price=>10}, {:name=>"Lahmacun", :price=>4}, {:name=>"Chicken Shish", :price=>10}, {:name=>"Iskender", :price=>12}, {:name=>"Icli Kofe", :price=>12}, {:name=>"Baklava", :price=>6}] 
2.5.0 :003 > t.pretty_menu
Oº°‘¨ Welcome to Grill Communication! ¨‘°ºO
0: Mixed Meze, £10
1: Lahmacun, £4
2: Chicken Shish, £10
3: Iskender, £12
4: Icli Kofe, £12
5: Baklava, £6
 => nil 
2.5.0 :004 > t.add_to_order 1, 5
 => [{:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}] 
2.5.0 :005 > t.add_to_order 2, 1
 => [{:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}, {:name=>"Chicken Shish", :price=>10}] 
2.5.0 :006 > t.basket
 => [{:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}, {:name=>"Lahmacun", :price=>4}, {:name=>"Chicken Shish", :price=>10}] 
2.5.0 :007 > t.total
 => 30 
2.5.0 :008 > t.confirm(30)
 => true  
```

We will confirm delivery time by text message. Bon appetit! 👨‍🍳

## My method

1. Be clear about the responsibilities of my classes
