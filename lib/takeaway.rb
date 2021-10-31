class Takeaway

  attr_reader :menu, :order_total

  def initialize
    @menu = { :salad => 1, :soup => 2, :chicken => 4, :fish => 3, :water => 1 }
    @order_total = []
  end

  def order(*args)
    args.each do |item|
      if @menu.include?(item)
        @order_total << @menu[item]
      else 
        fail "That is not a menu item, you can not order it"
      end
    end

  end

end
