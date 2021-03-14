class Order
  attr_reader :items, :total

  def initialize(menu = Menu.new)
    @items = []
    @total = 0
    @menu = menu
    @menu_items = menu.dishes
  end

  def add_item(dish, quantity = 1)
    # This method is currently doing too much and needs refactoring
    item = @menu_items.select { |menu_item| menu_item[:name] == dish }
    item = item.first
    item[:quantity] = quantity
    @items << item
    update_total(item)
  end

  def display_details
    # This method might also need to be broken down into separate methods:
    # one for creating string, the other for printing?
    statement = "Order summary:\n--------------\n"
    @items.each do |item|
      statement += "#{item[:quantity]} * #{item[:name]} (unit price #{item[:price]} GBP,
      total price #{item[:price] * item[:quantity]} GBP)\n"
    end
    statement += "----------\nTotal: #{@total}\n"
    print statement
  end

  private
  def update_total(item)
    @total += (item[:price] * item[:quantity])
  end
end
