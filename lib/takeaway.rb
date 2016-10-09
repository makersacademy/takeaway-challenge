class Takeaway

  attr_reader :menu

  def initialize
    @menu = [ {food: 'pizza', price: 10},
              {food: 'curry', price: 8},
              {food: 'rice', price: 2},
              {food: 'chips', price: 2},
              {food: 'lasagne', price: 8}
            ]

  end

  def list_menu
    @menu
  end

end
