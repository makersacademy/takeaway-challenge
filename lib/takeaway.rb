class Takeaway

attr_reader :order

  def initialize
    @order = []
    @menu = {:pepperoni => 10,
             :hawaiian => 12,
             :meat_feast => 15
            }
  end

  def menu
    @menu
  end

  def menu_select(order, amount=1)
      amount.times{ @order << @menu.slice(order) }
  end
end
