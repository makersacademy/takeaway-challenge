require_relative 'menu'

class Order 
attr_reader :menu, :order_list

  def initialize 
    @menu = Menu.new
    @order_list = []
  end 

  def take_order(item)
    @order_list << item
  end 

  def calculate_price
    # price = Menu.new.dishes.select{|x| x[:name] == @item1 || @item2 || @item3}.map{|y| y[:price].to_f}.inject(:+)
    # p "The total of the items you selected is #{price}"
  end 

end


# puts people.select{|x| x[:job_title] == "developer"}.map{|y| y[:salary].to_i}.reduce(:+)