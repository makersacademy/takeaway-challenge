require_relative 'menu'
require_relative 'confirmation'

class Order

  attr_reader :menu, :status

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
    status.each {|i| printer << "#{status.count(i)}x #{i.keys[0]}(s) = £#{i.values[0] * status.count(i)}"}
    printer.uniq.join(", ")
    # ...to be improved
  end

  def total
    "£#{calculator}"
    # ..to be improved
  end

  def checkout(amount)
    fail "wrong amount" if amount != calculator
    @status = []
  end

  private

  def calculator
    i = 0
    status.each {|h| i += h.values[0]}
    i.round(2)
  end

end
