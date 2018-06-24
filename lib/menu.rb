class Menu



total = order_list.inject(0) {|sum, hash| sum + hash[:total]}


def input_order
  dishes = { "oreo cookie sandwich " => 1, "chocolate eggo waffle" => 2, 
  "crispy chicken nuggets" => 3, "tangy beef jerky" => 1, "spicy lamb donner" => 4 }
  order_list = []
  puts "What would you like to order?"
  puts "To finish, please hit return twice"
  order = gets.chomp
  while !order.empty? do
  add_to_order_list
  puts "Your total comes to #{total}"
  end
end



def add_to_order_list(order, price)
  @order_list << {order: order, price: price.to_sym}
end


def print_dishes
  loop do
  print dishes
  end
end

end


