require_relative 'menu'

class Order

  attr_reader :current_order

  def initialize
    @current_order = []
  end

  def add_dish(id, quantity)
    fetch_dish(id) #catch error
    @dish[:quantity] = quantity
    dish_already_added?(id) ? update_dish_quantity(id, quantity) : @current_order << @dish
  end

  def remove_dish(id)
    fail 'Dish has not been added' unless dish_already_added?(id)
    index = @current_order.index { |dish| dish[:id] == id }
    @current_order.delete_at(index)
  end

  def update_dish_quantity(id, quantity)
    fail 'Dish has not been added' unless dish_already_added?(id)
    remove_dish(id) if quantity < 1
    @current_order.each { |dish| dish[:quantity] += quantity if dish[:id] == id }
  end

  def total
    @current_order.map { |dish| dish[:price] * dish[:quantity]}.reduce(:+)
  end

  # show dishes >>>test
  def show_dishes
    @@menu.display
  end

  # display order

  # place order
  # def place_order
  #   p "Your order has been placed. Order summary:"
  #   display_order  
  #   SendText.new(@current_order)
  # end



  private

  @@menu = Menu.new

  def fetch_dish(id)
    fail 'Invalid id' if @@menu.invalid_id?(id) #test
    fail 'Dish unavailable' unless @@menu.dish_available?(id) # test
    @dish = @@menu.select_dish(id)
  end

  def dish_already_added?(id)
    (@current_order.select { |dish| dish[:id] == id }) != [] ? true : false
  end

end