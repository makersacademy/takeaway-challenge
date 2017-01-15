#understands storing the chosen items and adding up the prices
require_relative "Menu"
require_relative "Printer"
require "./lib/core_ext/Fixnum"

class Basket
  def initialize menu = Menu.new
    @contents = []
    @menu = menu
    @printer = Printer
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

  def to_s
    final_line = "\n Total = #{total.to_pounds_and_pence}".rjust 64
    printer.to_string(self) + final_line
  end

  private
  attr_reader :contents, :menu, :printer

  def get_item item
    menu.get_item item
  end
end
