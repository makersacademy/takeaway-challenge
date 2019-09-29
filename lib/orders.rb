class Orders

  attr_reader :current_order, :history

  def initialize(menu: menu_object, dgt_class: DigitalTill)
    @menu = menu
    @current_order = []
    @history = []
    @digital_till_class = dgt_class
  end

  def make_order(items)
    save_order(items)
  end

  def submit_order(total)
    fail "Total does not match items" unless correct_total?(total)
    archive_order
  end

  private

  def save_order(items)
    items.split(',').each { |item| food, quantity = item.split
      @current_order << { quantity: quantity.to_i, item: food,
        cost: @menu.items[food.to_sym] * quantity.to_i }
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

end
