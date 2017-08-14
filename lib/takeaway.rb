class Takeaway

  def initialize(hash)
    @menu = Menu.new(hash)
    @order = Order.new
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

end
