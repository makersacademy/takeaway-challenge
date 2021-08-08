require "./lib/messager.rb"

class Order 
  attr_reader :items

  def initialize(messager = Messager.new)
    @messager = messager
    @items = Array.new
  end

  def checkout(minutes = 60)
    message = "Thank you! Your order will be delivered before " << time_plus_n_minutes(minutes)
    raise "failed to send sms to customer" unless @messager.send_sms(message)

    message
  end

  def time_plus_n_minutes(minutes)
    t = Time.now.to_i + (minutes * 60)
    Time.at(t).strftime("%H:%M")  
  end

  def add_to_order(dish, many, menu)
    @order_now, @dish, got_dish = self, dish, menu.get_dish(dish)
    many.times { @order_now.items << got_dish } unless got_dish.nil?
    raise "#{dish} dish is not in the menu" if got_dish.nil?

    "#{many}x #{dish}(s) added to your basket"
  end

  def chunk_dishes(summary)
    summary.chunk_while { |a, b| a.name == b.name }.to_a.map do |dishes|
      "#{dishes[0].name} x#{dishes.count} = £" << ('%.2f' % (dishes.count * dishes[0].price))
    end
  end

end
