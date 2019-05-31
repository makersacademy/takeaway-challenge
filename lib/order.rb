class Order
  attr_reader :ordered_items, :total, :menu_dishes
  def initialize(menu = Menu.new)
    @menu = menu
    @menu_dishes = menu.menu_dishes
    @ordered_items = []
    @total = 0
  end

  def display_menu
    @menu.list_menu
  end

  def select_dishes(item_chosen, quantity)
    @ordered_items.push(item_chosen, quantity)
    puts "#{quantity}x #{item_chosen} add to your basket"
    @total += (@menu_dishes[item_chosen] * quantity)
  end

  def price
    @total
  end
  
end
