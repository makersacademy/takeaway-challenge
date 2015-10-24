class Takeaway
  
  attr_reader :list_of_dishes, :total_price
  
  def initialize
  	@list_of_dishes = { "spaghettis"=> 8, "pizza"=> 12, "hamburguer"=> 15 }
  	@total_price = 0

  end

  def menu_list
  	@list_of_dishes.each { |name,price| puts "#{name}......€#{price}." }
  end

  def order(order, quantity = 1)
  	if order == "spaghettis"
  	  price = @list_of_dishes["spaghettis"] * quantity
  	  puts "you have ordered #{quantity} x spaghettis, the price is €#{price}."
  	  @total_price += price
  	elsif order == "pizza"
  	  price = @list_of_dishes["pizza"] * quantity
  	  puts "you have ordered #{quantity} x #{order}, the price is €#{price}."
  	  @total_price += price
    elsif order == "hamburguer"
  	  price = @list_of_dishes["hamburguer"] * quantity
  	  puts "you have ordered #{quantity} x #{order}, the price is €#{price}."
  	  @total_price += price
  	else
  	  puts "We don't have #{order} in the menu"
  	end
  end

end

ta = Takeaway.new
ta.menu_list
ta.order("spaghettis", 4)
ta.order("pizza", 2)
ta.order("hamburguer")
ta.order("paella")

puts "========="
p ta.total_price