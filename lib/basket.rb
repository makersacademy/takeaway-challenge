require_relative 'menu'

class Basket
  attr_reader :basket
  MINIMUM_ITEM_CODE = 1
  MAXIMUM_ITEM_CODE = 10
  MINIMUM_QUANTITY = 1

  def initialize
    @basket = []
    @menu = Menu.new
  end

  def add_to_basket(item_code, quantity = MINIMUM_QUANTITY)
    add_item_failed(item_code)
    quantity_added(item_code, quantity)
    add_item_success_message(item_code, quantity)
  end

  def remove_from_basket(item_code, quantity = MINIMUM_QUANTITY)
    remove_item_failed(item_code)
    quantity_removed(item_code, quantity)
    remove_item_success_message(item_code, quantity)
  end



  private

  def quantity_added(item_code, quantity)
    quantity.times do
      @basket << @menu.menu[item_code - 1]
    end
  end

  def add_item_success_message(item_code, quantity)
    chosen_item = @menu.menu[item_code - 1][:item]
    "#{quantity} #{chosen_item} added to basket"
  end

  def add_item_failed(item_code)
    fail "Please enter a valid item code." if item_code.is_a? String
    fail "Please enter a valid item code." if item_code < MINIMUM_ITEM_CODE
    fail "Please enter a valid item code." if item_code > MAXIMUM_ITEM_CODE
  end

  def quantity_removed(item_code, quantity)
    quantity.times do
      @basket.delete(@menu.menu[item_code - 1])
    end
  end

  def remove_item_success_message(item_code, quantity)
    chosen_item = @menu.menu[item_code - 1][:item]
    "#{quantity} #{chosen_item} removed from basket"
  end

  def remove_item_failed(item_code)
    fail "Error. Your basket is already empty." if @basket.empty?
    fail "Please enter a valid item code." if item_code < MINIMUM_ITEM_CODE
    fail "Please enter a valid item code." if item_code > MAXIMUM_ITEM_CODE
  end

end
