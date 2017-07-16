class Order

attr_reader :dish, :payment

  def initialize(dish)
    @dish = dish[0]
    @payment = dish[1]

  end


end
