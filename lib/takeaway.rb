class Takeaway

  attr_reader :menu

  def initialize
    @menu = { Cheeseburger: 5,
              Fries: 3,
              Milkshake: 2.99  }
  end

  def menu
    @menu
  end

end
