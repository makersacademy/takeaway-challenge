class Restaurant
attr_accessor :menu

  def initialize(menu = {Chicken: 3, Beef: 4})
    @menu = menu
  end

  def menu
    @menu.each do |k,v|
      puts "#{k}: £#{v}"
    end
  end

  def order(*dishes)
    @order = []
    menu_check(*dishes)
    dishes.each do |dish|
      @order << dish
    end
  end

  def menu_check(*dishes)
    dishes.each do |dish|
      raise "#{dish} is not on the menu" if !@menu.key?(dish.to_sym)
    end
  end

end
