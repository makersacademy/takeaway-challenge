class Sandcream
  attr_reader :sando_menu, :icecream_menu

  SANDO = [
    { sando: '1. Submarine Club - Tuna Salad', price: 9.50 },
    { sando: '2. Clubster Cluck - Grilled Chicken', price: 9.50 },
    { sando: '3. Shrimpy Sea Chanty - Prawn Cocktail', price: 10.50 },
    { sando: '4. Sweet Home Avocado - All Veggie', price: 9.00 },
    { sando: '5. Big City Life - Smoked Salmon & Cream Cheese', price: 10.50 },
    { sando: '6. Bologna Baloney- Pistachio Mortadella', price: 11.00 },
    { sando: '7. Egg Slut Sando - Egg Salad', price: 8.50 }
  ]

  ICECREAM = [
    { icecream: '8. Black & Gold - Tahini & Kharoub', price: 6.00 },
    { icecream: '9. Blueberry Hill - Blueberry Cheesecake', price: 5.50 },
    { icecream: '10. Strawberry Fields Forever - Strawberry & Cream', price: 5.50 },
    { icecream: '11. Cookie Thumper - Cookie Dough Vanilla Ice Cream', price: 5.50 },
    { icecream: '12. Watermelon Sugar - Watermelon Sorbet', price: 4.00 }, 
    { icecream: '13. Banana Pancakes - Banana & Peanut Butter', price: 5.50 }, 
    { icecream: '14. Lemon Tree - Amalfi Lemon Limoncello', price: 7.50 }  
  ]

  def initialize
    @sando_menu = SANDO
    @icecream_menu = ICECREAM
  end

  def print_sando
    puts 'SANDO SELECTION'
    lines
    @sando_menu.each do |dish| 
      puts "• #{dish[:sando]} - #{dish[:price]}0" 
    end
  end

  def print_icecream
    lines
    puts 'ICE CREAM SELECTION'
    lines
    @icecream_menu.each do |dish| 
      puts "• #{dish[:icecream]} - #{dish[:price]}0" 
    end
  end

  private
  def lines
    puts '-' * 60
  end
end
