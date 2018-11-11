# encoding: UTF-8
require_relative "menu"
require_relative "text_sender"
require 'twilio-ruby'

class Order

	def initialize
    @menu = Menu.new
    @order_list = []
		@total_price = []
		@text_sender = Text_sender.new
	end

	def take_order(dish, amount)
		return "No such dish" unless @menu.on_menu?(dish)
    sub_total(dish, amount)
	end
        
  def sub_total(dish, amount)
    @sub_total = 0
    @sub_total = @menu.menu[dish.to_sym] * amount
    add_order(dish,amount,@sub_total)
    @total_price << @sub_total
  end

  def add_order(dish,amount,sub_total)
    @order_list << "#{amount} #{dish} -- £#{sub_total}"
  end

  def cal_total
    @charge = @total_price.sum
  end

  def completed?
    return "No order has been added" if (@order_list[0] == nil)
    print_receipt
    true
  end

  def print_receipt
  	@text_sender.text_confirmation
    puts "Order total is :#{@charge}. Order list is as below:"
    @order_list.join("\n")
  end

end