require_relative 'menu'
require_relative 'confirmation'

class Order

  attr_reader :current_order, :order_placed

  def initialize
    @current_order = []
    @order_placed = false
  end

  def show_dishes
    @@menu.display
  end

  def add_dish(id, quantity)
    select_dish(id)
    if dish_already_added?(id) 
      add_by_updating_quantity(id, quantity)
    else
      @dish[:quantity] = quantity
      @current_order << @dish
    end
  end

  def remove_dish(id)
    fail_if_dish_not_added(id)
    index = @current_order.index { |dish| dish[:id] == id }
    @current_order.delete_at(index)
  end

  def update_dish_quantity(id, quantity)
    fail_if_dish_not_added(id)
    remove_dish(id) if quantity < 1
    @current_order.each { |dish| dish[:quantity] = quantity if dish[:id] == id }
  end

  def show_current_order
    fail_if_order_empty
    @current_order.map do |dish| 
      p "#{dish[:quantity]} x ##{dish[:id]} #{dish[:name]} - £#{dish[:price] * dish[:quantity]}"
    end
    puts "Order total: £#{total}"
  end

  def total
    fail_if_order_empty 
    @current_order.map { |dish| dish[:price] * dish[:quantity] }.reduce(:+)
  end

  def place_order(confirmation)
    fail_if_order_empty || (fail 'Order already placed' if @order_placed == true)
    @order_placed = true
    puts "Your order has been placed. Order summary:"
    show_current_order
    confirmation.send_text
    #Confirmation.new.send_text ### this would have had the tel number passed on as argument
  end

  private

  @@menu = Menu.new

  def select_dish(id)
    fail_if_invalid_id(id) || fail_if_dish_unavailable(id)
    @dish = @@menu.select_dish(id)
  end

  def add_by_updating_quantity(id, quantity)
    @current_order.each { |dish| dish[:quantity] = (dish[:quantity] + quantity) if dish[:id] == id }
  end

  def fail_if_invalid_id(id)
    fail 'Invalid id' unless @@menu.id_valid?(id)
  end

  def fail_if_dish_unavailable(id)
    fail 'Dish unavailable' unless @@menu.dish_available?(id)
  end

  def fail_if_dish_not_added(id)
    fail 'Dish has not been added' unless dish_already_added?(id)
  end

  def fail_if_order_empty
    fail 'Current order empty' if @current_order.empty?
  end

  def dish_already_added?(id)
    (@current_order.select { |dish| dish[:id] == id }) != []
  end

end
