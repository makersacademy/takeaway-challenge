require_relative 'menu'
require_relative 'takeaway'

class Basket

  attr_reader :available_items, :selected_items, :total

  def initialize(menu)
    @available_items = menu
    @selected_items = []
    @total = 0.00
  end

  def add_item(dish, quantity)
    select_dish(dish, quantity)
  end

  private

  def select_dish(dish, num)
    selection = @available_items.detect { |item| item[dish]}
    raise "Cannot add dish: This dish is unavailable" if selection == nil
    num.times do
      @selected_items.push(selection)
      update_total(selection)
    end
    "#{num} #{dish}(s) have been added to your basket"
  end

  private

    def update_total(item)
        item.each_value {|value| @total += value}
    end

end
