class Menu

  MENU_ITEMS = {
    "Banana Chowder" =>  5.45,
    "Hedgeree" => 7.65,
    "Thai Green Jelly" => 4.95,
    "Mackerel Muffins" => 3.75,
    "Smoked Goat Tart" => 6.75,
    "Prawn Sundae" => 6.75
  }

  def initialize
    @dishes = MENU_ITEMS
  end

  def show_dishes
    @dishes.each.with_index(1) do |(dish,price),index|
      puts "#{index}. #{dish} - £#{price}"
    end
  end

end
