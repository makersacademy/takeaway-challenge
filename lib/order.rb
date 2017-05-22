
class Order

  attr_reader :items, :menu, :status, :id, :total
  attr_writer :items

  def initialize(id, menu)
    @items  = []
    @id     = id
    @status = :new
    @menu   = menu
    @total  = 0.00
  end

  def add_dish(dish, quantity)
    valid_dish?(dish)
    get_dish_info_from_menu(dish)
    save_dish
    @items.last[:quantity] = quantity
  end

  def remove_dish(dish)
    valid_dish?(dish)
    get_dish_info_from_menu(dish)
  end

  def get_dish_info_from_menu(dish)
    @menu.list.each do |menu_item|
      @dish = menu_item if dish == menu_item[:name]
    end
  end

  def total
    total = 0
    @items.each do |item|
      total += item[:price] * item[:quantity]
    end
    total
  end

  def finalize
    @total = total
    @status = :finalized
  end

  def accepted
    @status = :accepted
  end
  
  private

  def valid_dish?(dish)
    @menu.list.each do |menu_item|
      return true if dish == menu_item[:name]
    end
    raise 'Item not found'
  end
  
  def save_dish
    @items << @dish
    @dish = nil
  end
  
end
