class Order
  attr_reader :reference, :dishes_list

  def initialize
    @reference = 0
    @dishes_list = []
  end
end