class Takeaway

  attr_reader :menu, :order

  def initialize(menu_klass)
    @menu = menu_klass.new
    @order = []
  end

  def check_menu
    @menu.show
  end

  def place_order(dish, quantity)
    raise 'Not on menu' if not_on_menu(dish)
    order.push([dish, quantity])
    puts "#{quantity} #{dish} added to your order."
  end

  private

    def not_on_menu(dish)
      !@menu.meals.has_key?(dish)
    end

end
