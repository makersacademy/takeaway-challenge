class Order

  attr_accessor :items
  attr_reader :menu, :status, :id, :total

  def initialize(id, menu)
    @items = []
    @id = id
    @status = :new
    @menu = menu
    @total = 0.00
  end

  def add_dish(dish, quantity = 1)
    valid_dish?(dish)
    get_dish_info_from_menu(dish)
    @dish[:quantity] = quantity
    save_dish
  end

  def remove_dish(dish, quantity = 1)
    valid_dish?(dish)
    get_dish_info_from_menu(dish)
    @dish[:quantity] = quantity
    @items.delete(dish)
  end

  def get_dish_info_from_menu(dish)
    @menu.list.each do |menu_item|
      @dish = menu_item if dish == menu_item[:name]
    end
  end

  def order_total
    total = 0
    @items.each do |item|
      total += item[:price] * item[:quantity]
    end
    total
  end

  def finalize_order
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
    fail 'Item not found'
  end

  def save_dish
    @items << @dish
    @dish = nil
  end

end
