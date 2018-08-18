class Orders

  attr_reader :orders, :total_bill

  def initialize(menu = Menu.new)
    @menu = menu
    @orders = {}
    @total_bill = []
  end

  def cust_order(dish, how_many)
    dish = dish.gsub(" ", "_").to_sym
    raise "sorry, dish is not available" unless Menu::MENU_SELECTIONS.include? dish
    @orders[dish] = how_many
  end

  def bill
    @orders.each do |dish, how_many|
      @total_bill << @menu.menu_items[dish] * how_many
    end

    @total_bill.sum
  end



end
