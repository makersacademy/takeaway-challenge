require_relative 'menu'

class Basket
  attr_reader :basket
  MINIMUM_ITEM_CODE = 1
  MAXIMUM_ITEM_CODE = 10
  MINIMUM_QUANTITY = 1

  def initialize(menu = Menu.new)
    @basket = []
    @menu = menu
  end

  def add_to_basket(item_code, quantity = MINIMUM_QUANTITY)
    add_item_failed(item_code)
    quantity_added(item_code, quantity)
    add_item_success_message(item_code, quantity)
  end

  # def remove_from_basket(item_code, quantity = MINIMUM_QUANTITY)
  #   remove_item_failed(item_code)
  #   quantity_removed(item_code, quantity)
  #   remove_item_success_message(item_code, quantity)
  # end

  def basket_summary
    total_message
  end

  def cost
    cost = 0
    @basket.each { |item| cost += item[:price] }
    cost
  end

  # def finalise_order
  #   basket_summary
  #   confirmation
  # end

  private

  def confirmation
    "Press enter to confirm order"
    input = gets.chomp
    # send text if input == ""
  end

  def total_message
    @basket.each { |item| puts "#{item[:item]}: #{item[:price]}" }
    "Total cost: £#{cost}"
  end

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

  # def quantity_removed(item_code, quantity)
  #   quantity.times do
  #     count = 0
  #     chosen_item_code = @menu.menu[item_code - 1][:item_code]
  #     @basket.delete_at[count] if chosen_item_code == item_code
  #     count += 1
  #   end
  # end
  #
  # def remove_item_success_message(item_code, quantity)
  #   chosen_item = @menu.menu[item_code - 1][:item]
  #   "#{quantity} #{chosen_item} removed from basket"
  # end
  #
  # def remove_item_failed(item_code)
  #   fail "Error. Your basket is already empty." if @basket.empty?
  #   fail "Please enter a valid item code." if item_code < MINIMUM_ITEM_CODE
  #   fail "Please enter a valid item code." if item_code > MAXIMUM_ITEM_CODE
  # end

end
