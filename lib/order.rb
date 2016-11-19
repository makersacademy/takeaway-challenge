class Order

attr_reader :dishes_list

  def initialize(dishes_list)
    @dishes_list = dishes_list
  end

  def which_dish
    puts "Please choose index number of the dish you would like to order."
    dish = gets.chomp.to_i
  end

  def how_many
    puts "How many portions of this dish would you like to order?"
    quantity = gets.chomp.to_i
  end

  def price(dish, quantity)
    (dishes_list[dish - 1])[:price] * quantity
  end

  def ordering_menu
    loop do
    price(which_dish, how_many)
    puts "Would you like to add any more dishes? (yes/no)"
      answer = gets.chomp
      break if answer == no
    end
  end


end
