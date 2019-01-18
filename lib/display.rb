require 'money'
I18n.enforce_available_locales = false
class Display

  def display_items(items)
    items.map.with_index do |item,index|
      "#{index +1}. #{item[:name].capitalize}: #{format_price(item)}"
    end
    .join("\n")
  end

  private

  def format_price(item)
    # money assumes it's given a pence value so * 100
    Money.new(item[:price] * 100, "GBP").format
  end
end
