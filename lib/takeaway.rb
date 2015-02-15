require_relative 'Messenger'

class Takeaway

def initialize
	@messenger = Messenger.new
	@restaurant_menu = {"Margherita Pizza" => 10, "Meat Lovers Pizza" => 13, "Risotto" => 8, "Spaghetti Carbonara" => 12,                             "Lasagna" => 15 }
end


def welcome_message
	print "Welcome to Italian Takeaway! Please view your order options below: \n"
end

def print_restaurant_menu
	@restaurant_menu.each do |item, price|
		puts "#{item}: $#{price}"
	end
end

def get_order
    order = Array.new
    price = 0
    
    print "What item you would like to order? (Type done when order is complete) \n"
    item_name = gets.chomp
    	
    while item_name != "done" do
    
    	print "How many #{item_name} would you like to order? "
    	quantity = gets.chomp.to_i
        
        order <<  {"name" => item_name, "quantity" => quantity}
        
    	price += quantity * @restaurant_menu.values_at(item_name) [0]
    	
    	print "What item you would like to order? "
    	item_name = gets.chomp
    	
    end
    
	print "This is your order: \n"
	order.each do |item| 
	    puts item.values_at("quantity")[0].to_s + " " + item.values_at("name")[0].to_s
	end
	
	print "This is the price of your order: $#{price}\n"
	
	confirm_order
	
end

def confirm_order
    print "Is this order accurate?  (Y/N) \n"
    confirm = gets.chomp
    if confirm == "Y" || confirm == "y"
        puts "Your order is complete. \nThank you!"
    else
        puts "Lets start over. \n"
        get_order 
    end
end

def send_sms
	messenger.confirmation(time)
end

end

# takeaway = Takeaway.new
# takeaway.welcome_message
# takeaway.print_restaurant_menu
# takeaway.get_order

