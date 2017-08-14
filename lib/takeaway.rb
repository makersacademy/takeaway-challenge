require 'dotenv'
Dotenv.load
require 'twilio-ruby'

class Takeaway

  def initialize(hash)
    @menu = Menu.new(hash)
    @order = Order.new
    @messager = Messager.new
  end

  def upload_menu(hash)
    @menu.upload(hash)
  end

  def read_menu
    puts @menu.read
  end

  def order(item, n = 1)
    if @menu.on_the_menu?(item)
      @order.add(item, n)
      puts "#{n}x #{item}(s) added to order"
    else
      puts "Sorry, no #{item} available"
    end
  end

  def order_summary
    @order.summary(@menu).each do |hash|
      puts "#{hash[:quant]}x #{hash[:item]} = £#{hash[:total]}"
    end
  end

  def order_total
    puts "The total bill is £#{@order.total(@menu)}"
  end

  def complete_order(paid)
    raise "wrong amount paid" unless paid_bill?(paid)
    send_text("Thank you for your order. Please expect delivery by #{Time.now + 3600}")
  end

  def send_text(message)
    Twilio::REST::Client.new(gets.chomp, gets.chomp)
      .messages.create(
        from: 441_874_202_012,
        to: 447_984_633_938,
        body: message
      )
  end

  def paid_bill?(paid)
    paid == @order.total(@menu)
  end

end
