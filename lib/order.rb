class Order

  attr_reader :time, :order

  def initialize(menu)
    @time = Time.now
    @order = {}
    @menu = menu
  end

  def add_item(dish, quantity)
    dish = dish.downcase.to_sym
    @order[dish] = quantity if @menu.on_menu?(dish)
  end

  def total
    total = 0
    @order.each do |dish, quantity|
      total += (@menu.price dish.downcase.to_sym) * quantity
    end
    total
  end



  def compile_order
  #   @selection.each do |item|
  #     item.each do |dish|
  #       menu.items
  end

end
