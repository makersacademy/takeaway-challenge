class TakeAway

  attr_reader :menu, :my_order

  def initialize
    @menu = {
        1 => { :padthai => 5.00 },
        2 => { :massamancurry => 5.00 },
        3 => { :bokchoi => 1.00 },
        4 => { :rice => 1.00 }
    }
    @my_order = []
  end

  def view_menu
    @menu.dup
  end

  def order(order_num)
    @menu.select do |k,v|
      if k == order_num
        @my_order << v
      end
    end
  end
end
