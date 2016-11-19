# Allows customer to select and add dishes to new order

require_relative 'menu.rb'

class Order

attr_reader :options, :new_order

  def initialize
    @new_order = []
    @options = Menu.new.menu_list
  end

  def see_options
    options
  end

  def select_pizza
    order = options.select {|k,v| k == :pizza}
  end

  # def select_meal(dish)
  #   dish =
  # end


end
