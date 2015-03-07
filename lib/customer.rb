class Customer
  attr_reader :tel, :name, :order

  def initialize(args)
    @name = args[:name] || rand(12345)
    @tel = args[:tel] || "+447542902955"
    @order = []
  end

  def choose(dish)
    @order << dish
  end

  def file_order
    menu.custom_order(@order, @order.length, @tel)
  end

end