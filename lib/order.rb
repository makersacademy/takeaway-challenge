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
    #binding.pry
    send_sms
  end

  def tw_setup
  account_sid = ENV['TWILIOID']
  auth_token = ENV['TWILIOID']
  @client = Twilio::REST::Client.new account_sid, auth_token 
  end

  def send_sms
  #tw_setup
  # @client.account.messages.create({
  #    :from => ENV['FROM'], 
  #    :to => ENV['TO'], 
  #    :body => '"Thank you! Your order was placed and will be delivered before #{((Time.new.hour)+1)}" + ":#{Time.new.min}"',  
  #    })
   end
end