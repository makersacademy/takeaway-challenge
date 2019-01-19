require 'money'
I18n.enforce_available_locales = false
class MenuPrinter

  def print_items(items)
    print format_items(items)
  end

  private

  def format_items(items)
    names_array(items).map.with_index do |index_name, index|
      "#{index_name}: #{price_array(items)[index]}"
    end.join("\n")
  end

  def price_array(items)
    items.values.map { |value| format_price(value) }
  end

  def names_array(items)
    items.keys.map.with_index do |key, index|
      "#{(index + 1)}. #{key.capitalize}"
    end
  end

  def format_price(item)
    # money assumes it's given a pence value so * 100
    Money.new(item * 100, "GBP").format
  end
end
