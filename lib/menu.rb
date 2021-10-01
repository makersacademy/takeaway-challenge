class Menu
  attr_reader :list, :order, :total

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
    @total = @order.values.map{ |v| v.match(/\d/)[0].to_i}.sum
  end

  def verify_order
    "Your total is #{@total} for the following #{@order}"
  end

  def confirm_order
    t = Time.new
    p "Thank you! Your order was placed and will be delivered before #{t.strftime("at %I:%M%p")}"
  end
end
