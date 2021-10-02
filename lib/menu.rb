require_relative 'menu_item'

module Menu
  ITEMS = [
    MenuItem.new("Margherita", 10),
    MenuItem.new("Diavola", 11),
    MenuItem.new("Boscaiola", 14),
    MenuItem.new("Quattro Stagioni", 13),
    MenuItem.new("Capricciosa", 12),
    MenuItem.new("Marinara", 9),
  ].freeze

  def self.view
    puts "Pizza Takeaway"
    puts "=============="
    ITEMS.each do |item|
      puts item
    end
    puts "=============="
  end
end
