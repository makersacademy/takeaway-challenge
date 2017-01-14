
class Order

 attr_reader :order, :current_order, :price

  def initialize(menu = Menu.new.dishes)
    @menu = menu
    @price = []
    @current_order = []
  end


  def place_order(selection, quantity)

    if @menu.has_key?(selection)
    @price << [quantity * @menu[selection].to_f]
    running_total = quantity * @menu[selection]
    @current_order << {:Selection => selection, :Quantity => quantity, :Total => running_total}
    end
  end

  private

  attr_reader :total

    def total
      @order_total = @price.inject(:+)
      @order_total.inject(:+)
    end

end
