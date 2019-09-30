class Orders

  attr_reader :current_order, :history

  def initialize(menu: menu_object, dgt_class: DigitalTill)
    @menu = menu
    @current_order = []
    @history = []
    @digital_till_class = dgt_class
  end

  def add_food(items)
    save_order(items)
  end

  def submit_order(total)
    fail "Total does not match items" unless correct_total?(total)
    archive_order
  end

  private

  def save_order(items)
    items.split(',').each { |item| food, quantity = item.split
      if already_exists?(food)
        update_item(food, quantity)
      else
        @current_order << new_item(food, quantity)
      end
    }
  end

  def correct_total?(total)
    @digital_till_class.new(@current_order).verify_total(total)
  end

  def archive_order
    @history << receipt
    @current_order = []
  end

  def receipt
    @digital_till_class.new(@current_order).itemised_receipt
  end

  def already_exists?(food)
    @current_order.any? { |ci| ci[:item] == food }
  end

  def update_item(food, quantity)
    @current_order.each { |ci|
      if ci[:item] == food
        ci[:quantity] += quantity.to_i
        ci[:cost] += @menu.items[food.to_sym] * quantity.to_i
      end
    }
  end

  def new_item(food, quantity)
    { quantity: quantity.to_i, item: food, cost: @menu.items[food.to_sym] * quantity.to_i }
  end
end
