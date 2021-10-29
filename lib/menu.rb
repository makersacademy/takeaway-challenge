require_relative 'item'

class Menu
  FULL_MENU = [
    Item.new("Egg fried rice", 4.99),
    Item.new("Steamed rice", 4.49),
    Item.new("Sesame prawn toast", 7.99),
    Item.new("Salt & pepper pork ribs", 9.95),
    Item.new("Cantonese lemon chicken", 8.95),
    Item.new("Lamb in black pepper sauce", 7.99)
  ].freeze

  attr_reader :import

  def initialize
    @import = FULL_MENU
  end

end
