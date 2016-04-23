class Dish

  attr_accessor :quantity
  attr_reader :args

  def initialize(args)
    @args = args
    @quantity = nil
  end
end