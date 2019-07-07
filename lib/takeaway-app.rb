class TakeawayApp

  attr_reader :menu_selection, :total

  def initialize(restaurant, message_service)
    @restaurant = restaurant
    @message_service = message_service
    @menu_selection = []
    @total = 0
  end

  def menu(selection, qty, total)
    @menu_selection << [selection, qty, total]
  end

  def order_confirmation
    totals_match? ? @message_service.message_manager(menu_selection, @total) : raise("Totals do not match, please check your order")
  end
   
  private

  def menu_selection_total
    selection_total = 0
    @menu_selection.each { |selection| selection_total += selection[2] }
    selection_total
  end

  def restaurant_order_total
    @menu_selection.each do |selection, qty|
      @restaurant.menu.each do |menu_item|
        @total += qty * menu_item[:price] if menu_item[:food] == selection
      end
    end
    @total
  end

  def totals_match?
    restaurant_order_total == menu_selection_total
  end
end
