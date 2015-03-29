class Takeaway
  attr_reader :menu

  def initialize
    @menu = { "meal-small": 5, "meal-medium": 10, "meal-large": 15 }
  end

  def customer_name name
    name
  end

  def customer_number number
    number
  end

  def show_menu
    @menu.inject("") do |show_menu, (k, v)|
      show_menu << "#{k.capitalize}: £#{v}\n"
    end
  end
end
