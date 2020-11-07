class Menu
  attr_reader :menu_items

  def initialize
    @menu_items = {
      "Goan pork vindaloo" => 14.00,
      "Kadai gosht" => 12.50,
      "Jaipuri kofta" => 12.50,
      "Malabari fish curry" => 13.00,
      "Kori gasi" => 11.50,
      "Shahi murg" => 11.00
    }
  end
end
