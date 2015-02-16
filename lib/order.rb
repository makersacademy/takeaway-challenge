require 'twilio-ruby'

class Order

  def dishes_choice
    $dishes = {"carbonara" => 11,
    	"bolognesa" => 9,
    	"pesto" => 10,
    	"sea food" => 13
    }
  end

  def menu_list
   puts "here is the list of the menu:"
   dishes_choice.each {|k, v| puts "#{k}: #{v}"}
   puts "Please choose the items you'd like to purchase by entering the name of the item followed by the quantity."
  end

  def selected_dishes
    @items ||= []
  end

  def selected_quantities
    @quantities ||= []
  end

  def order_count
    if @items == nil
      0
    else
      @items.order_count
    end
  end

  def add_dish(item, amount)
    selected_dishes << item
    selected_quantities << amount
  end

    def cost(item, amount)
    amount * $dishes[item].to_i
  end

  def delivery_time
    time = [Time.now.hour + 1, Time.now.min]
    "#{time[0]}.#{time[1]}"
  end

  def send_message
  	account_sid = 'AC97531c3706f52626e04532164dfd12e8' 
		auth_token = '[AuthToken]' 
 
		@client = Twilio::REST::Client.new account_sid, auth_token 
 
		@client.account.messages.create({
		:from => '+441254790223', 
		:to => '07474718811', 
		:body => '"Thank you! Your order was placed and will be delivered before 18:52"',  
		})
  end

end