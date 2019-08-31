require './lib/currency_math'
require './lib/menu'

Order = Struct.new(:menu_items) do
  include CurrencyMath
  include LineItemListPrinter

  def total
    menu_items.reduce('') { |total, item| add(total, item.price) }
  end

  def to_string(conjoiner = "\n")
    line_items_string(conjoiner) + "#{conjoiner}Total: #{total}"
  end
end