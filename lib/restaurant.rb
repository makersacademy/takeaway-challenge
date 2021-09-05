require_relative 'menu'

class Restaurant

  attr_reader :list_of_dishes
  attr_reader :order

  def initialize
  menu = Menu.new
  @list_of_dishes = menu.list 
  @order = []
  end 

  def read_menu
  @list_of_dishes
  end 

  def select_dish(choice)
    @list_of_dishes.each {|k,v| if k == choice.downcase
    @order << k 
    end}
    puts "#{choice} was added to your basket, your current total is £#{check_total}"
  end


  def check_total
    running_total = []
    order.each{|el| list_of_dishes.each{|k,v| if k == el
    running_total << v
    end}}
    running_total.inject(:+)
    # puts "Your running total is #{x}"
  end

  def finalised?(price)
    price_correct(price)
  end

  private 

  def price_correct(price)
    price == check_total
  end

end


