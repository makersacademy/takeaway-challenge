class Restaurant
  attr_reader :menu
  def initialize
    @menu = {
      "antipasti" =>  7,
      "coffee cake" =>  4,
      "cheese toastie" =>  4,
      "irish coffee" =>  3,
      "nigel special" => 1
    }
  end

  def format_menu
    menu.each{|key,value| puts "#{key}: £#{value}"}
  end

  def calculate_bill(customer_order)
    total = 0
    customer_order.each{|key, value|
      total += (customer_order[key] * menu[key])
    }
    total
  end

  def send_text(cost)

  end

end
