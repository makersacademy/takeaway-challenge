class Menu
  attr_reader :list, :order

  def initialize
    @list = {
      1 => "cod £5",
      2 => "fishcake £4",
      3 => "chips £3"
    }
    @order = []
  end

  def see_list
    @list
  end

  def place_order(*item)
    @order = @list.slice(*item)
    p total = @order.values.map{ |v| v.match(/\d/)[0].to_i}.sum
  end
end
