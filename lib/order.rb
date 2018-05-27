class Order
  attr_accessor :menu, :basket, :subtotal

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @subtotal = []
  end

  def add_to_basket(juice)
    @basket << juice
  end

  def total(expected_total)
    # raise "Incorrect order total" unless @subtotal == expected_total
    @basket.each do |item|
      @menu.show_menu.each do |juice, price|
        @subtotal << price if juice == item
      end
    end
    @subtotal.reduce(:+)
    return @subtotal
  end

end
