class Menu

  attr_reader :menu
  
  def initialize
    @menu = [{ dish: 'Margherita', price: 8.45 }, 
              { dish: 'Salsiccia e Friarelli', price: 12.75 },
              { dish: 'Prosciutto di Parma e Rucola', price: 12.45 },
              { dish: 'Grilled Salmon with Mayonnaise Sauce', price: 16.95 },
              { dish: 'Fritto Misto di Calamari', price: 17.45 },
              { dish: 'Vitello Milanese', price: 16.55 }]
  end

  def select(dish)
    @menu.find { |item_name| item_name[:dish] == dish }
  end
end
