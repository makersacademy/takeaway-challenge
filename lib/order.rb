require_relative 'dishes_list'

class Order

attr_reader :dishes_list
attr_reader :total, :ordered_dishes

  def initialize(dishes_list)
    @dishes_list = dishes_list
    @total = 0
    @ordered_dishes = []
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
    price = (dishes_list[dish - 1])[:price] * quantity
    add_to_ordered(dish, quantity, price)
    self.total += price
  end

  def more?
    gets.chomp == "yes"
  end

  def ordering_menu
    price(which_dish, how_many)
    puts "Would you like to add any more dishes? (yes/no)"
    ordering_menu if more?
  end

  private
  attr_writer :total, :ordered_dishes

  def add_to_ordered(dish, quantity, price)
    self.ordered_dishes << ((dishes_list[dish - 1]).merge({:quantity=>quantity, :total=>price }))
  end

end
