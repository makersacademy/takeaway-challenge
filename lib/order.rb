require './lib/currency_math'
require './lib/menu'

Order = Struct.new(:line_items) do
  include CurrencyMath
  include LineItemListPrinter

  def total
    line_items.reduce('') { |total, item| add(total, item.price) }
  end

  def to_string(conjoiner = "\n")
    print_line_items(conjoiner) + "#{conjoiner}Total: #{total}"
  end
end