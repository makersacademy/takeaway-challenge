class Customer
  attr_reader :tel, :name, :order

  def initialize(args)
    @name = args[:name] || rand(123)
    @tel = args[:tel] || "+447542902955"
    @order = []
  end

  def choose(bla)
    @order << bla
  end


end