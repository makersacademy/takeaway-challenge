#require_relative 'send_sms.rb'

class Order

  attr_reader :show_menu, :selection, :total
  def initialize
    @show_menu = [{"1": "Garlic Bread with cheese", price: 6},
                  {"2": "Pepperoni", price: 12},
                  {"3": "Hawaiian", price: 11}
                  ]
    @selection = []
    @total = nil
  end

  def select_pizza(menu_num, quantity)
    quantity.times { @selection.push(@show_menu[menu_num.to_i - 1]) }
  end

  def calculate_total
    num = 0
    total = 0
    while num < @selection.length
    total += @selection[num][:price]
    num += 1
    end
    @total = total
  end

  def complete_order
    send_sms("You have succesfully ordered your pizza! Total: £#{@total}")
  end

  def send_sms(message)
    message
  end

end
