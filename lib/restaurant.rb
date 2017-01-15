require "./lib/email_conf.rb"

class Restaurant

  attr_reader :menu, :order, :count, :mailer, :text_message, :time

  def initialize

    @menu = [{"fried-rice" => "£ 5"}, {"beef-stew" => "£ 4"},{"lemon-meringue" => "£ 3"},{"assorted-chocolates" => "£ 3"}]
    @order =[]
    @count = 0
    @mailer = Email_conf.new
    @time = Time.now + 60 * 60

  end

  def display_menu

    menu.each do |items| items.each do |k,v|
      p "Dish: #{k} ----- Price: #{v}"
    end
    end

  end

  def order_items(item,number)
    dishes = menu.map{|key|key.keys}.flatten
    order << {dish: item, size: number} if dishes.include?(item)
    puts "this dish does not exist" if !dishes.include?(item)
  end

  def finish_order(total,phone_number = "447795556112")
    @count = 0
    order.each do |items| items.each do |k,v| @count += v.to_i end end
    raise "the total given does not equal the dishes ordered" if total != count
    puts "you have ordered #{count} dishes"
    send(phone_number = "447795556112")
    @order = []
  end

  def send(phone_number)
      #mailer.send_text("Your order will be delivered before #{sprintf '%02d',time.hour}:#{sprintf'%02d',time.min}",phone_number)
  end


end
