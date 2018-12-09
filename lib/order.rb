class Order

  require_relative "./menu.rb"
  require_relative "./menu_displayer.rb"

  attr_reader :total, :cart, :payment_type, :payment

  def initialize(payment_type = "card")
    @menu = Menu.new
    @cart = []
    @total = 0
    @payment_type = payment_type
    @payment = false
  end

  def add(item, amount = 1)
    item_number = 0
    @cart << { (item_number += 1) => @menu.list[item - 1], :amount => amount }
    update_total
  end

  def update_total
    @cart.each { |item|
      price = item.dig(1, :price).to_f
      amount = item.dig(:amount).to_f
      @total += (price * amount)
    }
  end

  def place
    if @payment_type == "cash" || (@payment_type = "card"  && @payment == true)
      send_to_kitchen(@cart)
    elsif @payment_type == "card" || @payment == false
      "order not payed for, please use .change_payment_type if paying cash"
    end
  end

  def secure_payment
    pay(@total)
  end

  def change_payment_type
    @payment_type = "cash"
  end

  private

  def  send_to_kitchen(order)
    #sends kitchen(order) to print
    "Thank you! Your order was placed and will be delivered before #{((Time.new.hour)+(1))}:#{(Time.new.min)}"
  end

  def pay(total)
    @payment = true
  end

end
