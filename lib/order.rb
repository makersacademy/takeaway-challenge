class Order

  attr_reader :dishes

  def initialize
    @dishes = []
    @menu = Menu.new
  end

  def select_dish(name = nil, quantity = 1)
    @name = name
    @quantity = quantity
    fail "Can't select: dish not available. Type `takeaway.show_menu` to see the menu" unless available?
    @dishes << { :name => name, :quantity => quantity }
  end

  def total_cost
    @dishes.map { |dish|
      @menu.price(dish[:name]) * dish[:quantity]
    }.sum
  end

  def nothing_selected?
    @dishes.empty?
  end

  def available?
    @menu.list_of_dishes.any? { |hash| hash[:name] == @name }
  end
end
