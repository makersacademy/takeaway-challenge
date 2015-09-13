class TakeAway
 

  attr_writer :menu, :meal_order
 
   def initialize
     @menu = { "pizza" => 9.99,
               "cheeseburger" => 4.99,
               "steak" => 14.99,
               "salad" => 6.99
             }

     @meal_order = []
   end

   def show_menu
   	@menu.sort{|a,b| a[1]<=>b[1]}.each { |elem| puts " #{elem[0].capitalize}: #{elem[1]}"}
   end
 
 
  def select_dish(dish)
    fail "I'm sorry, we don't have that dish" unless @menu.include?(dish)
    @meal_order << dish
  end

  def order_summary
    puts "you have ordered #{@meal_order.count} item, consisting of #{@meal_order}"
  end


  def place_order
    fail "Please select at least one item" unless !@meal_order.empty?
    send_message
      end
 

	def send_message

		require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
		require 'twilio-ruby' 
		 
		# put your own credentials here 
		account_sid = 'ACc883607ece96532c6655b59873591b40' 
		auth_token = 'd9ed0c3613d2eb80f0c50677c20b2ce2' 
		 
		# set up a client to talk to the Twilio REST API 
		@client = Twilio::REST::Client.new account_sid, auth_token 
		 
		@client.account.messages.create({
			:from => '+441908410329', 
			:to => '+44 7984676404', 
			:body => '"Thank you for your order, it will be delivered in 1 hour"',  
		})

	end	
end