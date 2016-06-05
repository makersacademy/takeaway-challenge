class Order

  attr_reader :menu, :status, :trolley

  def initialize(menu = Menu::MENU_LIST)
    @menu = menu
    @status = []
  end

  def add(item, quantity = 1)
    quantity.times {@status << @menu.select {|k,_| k == item}}
    "#{quantity}x #{item}(s) added to our order!"
    # ...to be improved
  end

  def trolley
    printer = []
    @status.each do |i|
      printer << "#{@status.count(i)}x #{i.keys[0]}(s) = £#{i.values[0] * @status.count(i)}"
    end
    printer.uniq.join(", ")
    # ...to be improved
  end

  def checkout
  end

end

# def order_total
# ...
# end
