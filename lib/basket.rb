#understands storing the chosen items and adding up the prices
require_relative "menu"
require_relative "printer"
require_relative "phone"
require "./lib/core_ext/integer"

class Basket
  def initialize args
    args = defaults.merge(args)
    @contents = []
    @menu     = args[:menu]
    @printer  = args[:printer]
    @phone    = args[:phone]
  end

  def items
    contents.dup
  end

  def add item
    @contents << get_item(item)
  end

  def total
    @contents.inject(0) {|sum,item| sum + item.price}
  end

  def finish_order amount, phone_number
    fail "incorrect amount given" if amount != total
    fail "empty basket!" if items.empty?
    phone.send_confirmation_text (phone_number)
  end

  def to_s
    final_line = "\n Total = #{total.to_pounds_and_pence}".rjust 64
    printer.to_string(self) + final_line
  end

  private
  attr_reader :contents, :menu, :printer,:phone

  def defaults
    {menu: Menu.new,
    printer: Printer,
    phone: Phone}
  end

  def get_item item
    menu.get_item item
  end
end
