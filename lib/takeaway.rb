class Takeaway
  def initialize(menu:, ordering: nil) # injecting menu as we don't want to creat menu in takeaway class
    @menu = menu
    @ordering = ordering || Ordering.new #initialize order from order class, order being nil
  end

  def print_menu # US1
    menu.print # calling the menu from the Menu class, menu will handle printing the menu
  end

  def place_order(list_of_dishes)
    list_of_dishes.each do |dish, qty|
      ordering.add(dish, qty)
    end
    ordering.sum
  end

  private

  attr_reader :menu, :ordering # making menu, order accessible
end