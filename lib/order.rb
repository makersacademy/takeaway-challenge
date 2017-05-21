
class Order

  attr_reader :items, :menu
  attr_writer :items

  def initialize(menu)
    @items = []
    @status = :new
    @menu = menu
  end

  def add_dish(dish, quantity = 1)
    valid_dish?(dish)
    get_dish_info_from_menu(dish)
    @items << @dish
  end

  def remove_dish(dish)
    valid_dish?(dish)
    get_dish_info_from_menu(dish)
  end

  def order_total
    total = 0
    @items.each do |item|
      total += item[:price]
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
    raise 'Item not found'
  end
  
end
