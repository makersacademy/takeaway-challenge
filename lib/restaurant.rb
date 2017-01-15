require "./lib/email_conf.rb"

class Restaurant

  attr_reader :menu, :order, :count, :mailer, :text_message, :time

  def initialize

    @menu = [{"fried rice" => "5 Pounds"}, {"beef-stew" => "4 Pounds"}]
    @order =[]
    @count = 0
    @mailer = Email_conf.new
    @time = Time.now + 60 * 60

  end

  def display_menu

    p menu

  end

  def order_items(item,number)
    order << {dish: item, size: number}
  end

  def finish_order(total,phone_number = "447795556112")
    @count = 0
    order.each do |items| items.each do |k,v| @count += v.to_i end end
    raise "the total given does not equal the dishes ordered" if total != count
    puts "you have ordered #{count} dishes"
    mailer.send_text("Your order will be delivered before #{time.hour}:#{time.min}",phone_number)
    @order = []
  end


end
