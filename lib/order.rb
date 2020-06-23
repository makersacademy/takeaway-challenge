require_relative "menu.rb"

class Order
  attr_accessor :list, :submitted, :menu
  def initialize(menu = Menu.new)
    @list = []
    @menu_def = menu
    @menu = menu.list
    default_menu
  end

  def default_menu
    @menu_def.add("Haddock",5.20)
    @menu_def.add("Cod",6.50)
    @menu_def.add("Chips",5.99)
  end

  def read_menu
    @menu.display
  end

  def list_order
    @list.each.map { |dish| 
    "#{dish[:name]}: £#{dish[:price]}"
    }.to_a.join("\n")
  end

  def add(number)
    @list << @menu[number.to_i - 1] if @menu[number.to_i - 1]
  end

  def remove(number)
    @list.delete(@menu[number - 1])
  end

  def total
    sum = 0
    @list.each {|x| sum += x[:price]}
    sum
  end

  def submit
    @submitted = true
    "
    Thank you! 
    Your order was placed at #{Time.now.strftime("%k:%M")} and will be delivered before #{(Time.now+1800).strftime("%k:%M")}
    We confirm that your order was as follows: \n
    #{list_order}

    -----
    £#{total}
    CASH ON DELIVERY"
  end
end

