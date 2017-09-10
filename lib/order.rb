class Order

  attr_accessor :items
  attr_reader :menu

  def initialize(menu)
    @items = []
    @status = :new
    @menu = menu
  end

  def add_dish(dish, quantity = 1)
    valid_dish?(dish)
    get_dish_info_from_menu(dish)
    @dish[:quantity] = quantity
    @items << @dish
  end

  def remove_dish(dish, quantity = 1)
    valid_dish?(dish)
    get_dish_info_from_menu(dish)
    @dish[:quantity] = quantity
    @items.delete(dish)
  end

  def order_total
    total = 0
    @items.each do |item|
      total += item[:price] * item[:quantity]
    end
    total
  end

  def finalize_order

  end

  def get_dish_info_from_menu(dish)
    @menu.list.each do |menu_item|
      @dish = menu_item if dish == menu_item[:name]
    end
  end

  private

  def valid_dish?(dish)
    @menu.list.each do |menu_item|
      return true if dish == menu_item[:name]
    end
    fail 'Item not found'
  end

end
