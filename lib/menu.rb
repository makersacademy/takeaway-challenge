class Menu
  attr_reader :food

  def initialize
    @food = {
      "Goan pork vindaloo" => 14.00,
      "Kadai gosht" => 12.50,
      "Jaipuri kofta" => 12.50,
      "Malabari fish curry" => 13.00,
      "Kori gasi" => 11.50,
      "Shahi murg" => 11.00
    }
  end
end
