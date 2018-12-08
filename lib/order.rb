require_relative 'menu'

class Order 
attr_reader :menu, :items_ordered, :item

  def initialize 
    @menu = Menu.new
    @items_ordered = []
  end 

  def take_order(item)
    @items_ordered << item
  end 

  def calculate_total
    price = @menu.dishes.select{|x| x[:name] if @items_ordered.include?(x[:name]) }.map{|y| y[:price].to_f}.inject(:+)
    p "The total of the items you selected is #{price}"
  end 

end


# puts people.select{|x| x[:job_title] == "developer"}.map{|y| y[:salary].to_i}.reduce(:+)