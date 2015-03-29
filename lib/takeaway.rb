class Takeaway
  attr_reader :menu
  attr_accessor :customer_name, :customer_number

  def initialize
    @menu = { "meal-small": 5, "meal-medium": 10, "meal-large": 15 }
  end

  def customer name, number
    @customer_name = name
    @customer_number = number
  end

  def show_menu
    @menu.inject("") do |show_menu, (k, v)|
      show_menu << "#{k.capitalize}: £#{v}\n"
    end
  end

  def order_list
  end
end
