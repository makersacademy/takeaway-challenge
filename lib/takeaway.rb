class Takeaway

  attr_reader :menu, :my_order

  def initialize
    @menu = { :salad => 1, :soup => 2, :chicken => 4, :fish => 3, :water => 1 }
    @my_order = []
    @total = 0
  end

  def order(*args)
    args.each do |item|
      if @menu.include?(item)
        @my_order << item
      else 
        fail "That is not a menu item, you can not order it"
      end
    end

    "Thank you! Your order was placed and will be delivered before 18:52"
  end

  def check_total
    @my_order.each do |item|
      @total += @menu[item]
    end

    @total
  end





end
