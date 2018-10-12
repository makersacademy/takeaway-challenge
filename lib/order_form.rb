class OrderForm

  def initialize
    @order = []
    @menu = Menu.new
  end

  attr_reader :order

  def add_to_order(item)
    @menu.menu_list.each do |food, price|
      @order << ({food => price}) if item == food.to_s
    end
  end

end
