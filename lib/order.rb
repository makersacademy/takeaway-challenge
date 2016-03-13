class Order

  attr_reader :time, :order, :selection

  def initialize
    @time = Time.now
    @order = Array.new
  end

  def choice(dish, quantity)
    @selection ||= Array.new
    @selection << [dish, quantity]
  end

  def compile_order
  #   @selection.each do |item|
  #     item.each do |dish|
  #       menu.items
  end
end
