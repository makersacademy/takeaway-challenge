require 'pry'
require 'twilio-ruby'

class Order

  attr_reader :menu, :current_order, :summary

  def initialize(menu)
    @menu = menu
    @current_order = Hash.new
    @summary = []
    
  end

  def see_menu
    menu.see_dishes
  end

  def place_order(name, quantity)
    @current_order[@menu.place_order(name)]= quantity
    subtotal(name, quantity)
  end

  def subtotal(name, quantity)
    @sum = 0
    #binding.pry
    @sum = @current_order.keys.last.price*quantity
    summarize(name, quantity)
    @sum
  end

  def summarize(name, quantity) # when refactoring this might be able to go into place order
   @summary << [name, quantity, @sum]
  end

  def total
    total = 0
    @summary.each do |order|
      total += order[2]
    end
    summary + [[:total, total]]
  end


  def confirm_order(money)
    raise "Insufficient payment" if money != total.last[1]
    send_sms
  end


private
  def send_sms
  account_sid = 'ACc7333e016936b7abf7ea074e16eadb8c'
  auth_token = '[e498717d0bb400106172bb47a4368d73]'
  @client = Twilio::REST::Client.new account_sid, auth_token 


  @client.account.messages.create({
    :from => '+441593362052', 
    :to => '+491604729966', 
    :body => 'some text',  
  })
  end
end