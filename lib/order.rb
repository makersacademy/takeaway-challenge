
class Order

  attr_reader :items, :menu, :status, :id
  attr_writer :items

  def initialize(menu)
    @items = []
    @id = nil
    @status = :new
    @menu = menu
  end

  def add_dish(dish, quantity = 1)
    valid_dish?(dish)
    get_dish_info_from_menu(dish)
    @dish[:quantity] = quantity
    save_dish
  end

  def remove_dish(dish)
    valid_dish?(dish)
    get_dish_info_from_menu(dish)
  end

  def total
    total = 0
    @items.each do |item|
      total += item[:price] * item[:quantity]
    end
    total
  end
  
  def save_dish
    @items << @dish
    @dish = nil
  end

  def finalize(order_id)
    @status = :finalized
    @id = order_id
  end

  def accepted
    @status = :finalized
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
