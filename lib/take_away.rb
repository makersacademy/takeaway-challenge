require_relative 'order'
require_relative 'menu'

class TakeAway
  attr_reader :menu, :list_of_choices
  def initialize(menu)
    @menu_hash = menu
    @menu = Menu.new(menu)
    @list_of_choices = []
  end

  def choose(dish, quantity = 1)
    raise "That dish isn't on the menu!" unless @menu_hash.key?(dish.to_sym)
    add_more_portions(dish, quantity) if @list_of_choices.any? { |hash| hash.value?(dish) }
    add_new_dish(dish, quantity) unless @list_of_choices.any? { |hash| hash.value?(dish) }
  end

  def start_over
    @list_of_choices = []
  end

  def finalise
    raise "You haven't chosen anything yet.." if @list_of_choices.empty?
    @order = Order.new(@list_of_choices)
  end

  private

  def add_new_dish(dish, quantity)
    @menu_hash.each do |key, value|
      if key == dish.to_sym
        @list_of_choices.push({ :choice => dish.to_s, :price => value.to_f, 
        :portions => quantity, :sub_total => (quantity * value) }) 
      end
    end
  end

  def add_more_portions(dish, quantity)
    @list_of_choices.each { |hash| hash[:portions] += quantity if hash.value?(dish.to_s) }
  end
end
