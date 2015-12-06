class Takeaway
attr_reader :menu, :current_order

  def initialize
    @menu = { pizza: 6,
              hamburger: 7,
              curry: 5,
              chips: 3,
              cake: 4 }
    @current_order = []
  end

  def add_to_order(dish, quantity)
    @current_order << [ dish, quantity ]
  end
end
