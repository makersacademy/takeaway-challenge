require 'money'
I18n.enforce_available_locales = false
class MenuPrinter

  def print_items(items)
    print format(items)
  end

  private

  def format(items)
    items.map.with_index do |item, index|
      "#{index + 1}. #{item[:name]}: #{format_price(item[:price])}"
    end.join("\n")
  end

  def format_price(item)
    # money assumes it's given a pence value so * 100
    Money.new(item * 100, "GBP").format
  end
end
