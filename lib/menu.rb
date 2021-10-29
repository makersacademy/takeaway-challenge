class Menu
  FULL_MENU = [
    { :item => "Egg fried rice", :price => 4.99 },
    { :item => "Steamed rice", :price => 4.49 },
    { :item => "Sesame prawn toast", :price => 7.99 },
    { :item => "Salt & pepper pork ribs", :price => 9.95 },
    { :item => "Cantonese lemon chicken", :price => 8.95 },
    { :item => "Lamb in black pepper sauce", :price => 7.99 }
  ].freeze

  attr_reader :import

  def initialize
    @import = FULL_MENU.each { |h| h[:quant] = 0 }
  end

end
