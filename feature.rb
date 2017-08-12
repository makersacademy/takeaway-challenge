men = Creating_menu.new
men.putting_hash_into_file


2.4.0 :001 > menu = Hash.new
 => {}
2.4.0 :002 > menu = { "deep fried": 10, "cats": 11}
 => {:"deep fried"=>10, :cats=>11}
2.4.0 :003 > menu["deep fried"]
 => nil
2.4.0 :004 > menu.last
NoMethodError: undefined method `last' for {:"deep fried"=>10, :cats=>11}:Hash
	from (irb):4
	from /Users/abitravers/.rvm/rubies/ruby-2.4.0/bin/irb:11:in `<main>'
2.4.0 :005 > menu
 => {:"deep fried"=>10, :cats=>11}
2.4.0 :006 > menu.each do | key, hash |
2.4.0 :007 >     puts "#{key}, #{hash}"
2.4.0 :008?>   end
deep fried, 10
cats, 11
 => {:"deep fried"=>10, :cats=>11}
2.4.0 :009 >


menu.each_value { |value| puts value }
10
11
