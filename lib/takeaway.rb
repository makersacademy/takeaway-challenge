require_relative 'texter'
require_relative 'menu'

class Takeaway

  #attr_reader :menu
  attr_reader :order_list
  attr_reader :total_price
  attr_reader :check_price


  def initialize(texter, menu)
    @texter = texter
    @menu = menu
    @order_list = []
    @total_price = 0
  end

  def show_menu
    menu.show
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
    @order_list.each do |x|   
      @total_price += @menu.fetch(x)
    end
    @total_price
  end

  def confirm_order
    fail 'Please check the price again' if @check_price == false
    @texter.send
  end
end