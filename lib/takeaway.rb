

class Takeaway

  attr_reader :menu
  attr_reader :order_list
  attr_reader :total_price
  attr_reader :check_price


  def initialize
    @menu = { 'tempura'     => 8,
              'okonomiyaki' => 7,
              'yakisoba'    => 6,
              'gyoza'       => 3
            }
    @order_list = []
  end

  def show_menu
    @menu
  end

  def order(item, multiple)
    multiple.times { @order_list.push(item) }
  end

  def check_price(price)
    @check_price = (price == order_total)? true : false
    if @check_price == true
      puts 'Please go ahead and confirm the order'
    else
      puts 'Please check the price again before confirming the order'
    end
    @check_price
  end

  def order_total
    @total_price = 0
    @order_list.each do |x| 
      @total_price += @menu.fetch(x)
    end
    @total_price
  end

  def order_confirm
    fail 'Please check the price again' if @check_price == false
    text
  end

  def text
    true
  end
# require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
# require 'twilio-ruby' 
 
# # put your own credentials here 
# account_sid = 'AC278ede151bffcfda7e17631a21618408' 
# auth_token = '[AuthToken]' 
 
# # set up a client to talk to the Twilio REST API 
# @client = Twilio::REST::Client.new account_sid, auth_token 
 
# @client.account.messages.create({    
# })

end