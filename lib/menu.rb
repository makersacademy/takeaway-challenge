require_relative 'item'

class Menu
  DEFAULT_ITEMS = [
    Item.new("Egg fried rice", 4.99),
    Item.new("Steamed rice", 4.49),
    Item.new("Sesame prawn toast", 7.99),
    Item.new("Salt & pepper pork ribs", 9.95),
    Item.new("Cantonese lemon chicken", 8.95),
    Item.new("Lamb in black pepper sauce", 7.99)
  ].freeze

  attr_reader :items

  def initialize(items = DEFAULT_ITEMS)
    @items = items
  end

  def review_menu(i = 0)
    @items.map { |h| "#{i += 1}. #{h.name}, £#{h.price}" }.join("\n")
  end

  def valid_choice?(n)
    (1..@items.length).include?(n.to_i)
  end

  def fetch_item(n)
    @items[n.to_i - 1]
  end

end
