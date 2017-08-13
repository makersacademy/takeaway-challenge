class Takeaway

def initialize(hash)
  @menu = Menu.new(hash)
  @order = Order.new
end

def upload_menu(hash)
  @menu.upload(hash)
end

def read_menu
  print @menu.read
end

def order(item, n=1)
  if @order.add(item, n)
    @order.add(item, n)
    print "#{n}x #{item}(s) added to order"
  else
    print "Sorry, no #{item} available"
  end
end

def order_summary
  @order.summary.each do |hash|
    puts "#{hash[:quant]}x #{hash[:item]} = £#{hash[:total]}"
  end
end


end
