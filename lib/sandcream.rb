class Sandcream
  attr_reader :sando_menu, :icecream_menu

  def initialize
    @sando_menu = [ 
      # Sandos
      { sando: '1. Submarine Club - Tuna Salad', price: 9.50 },
      { sando: '2. Clubster Cluck - Grilled Chicken', price: 9.50  },
      { sando: '3. Shrimpy Sea Chanty - Prawn Cocktail', price: 10.50  },
      { sando: '4. Sweet Home Avocado - All Veggie', price: 9.00 },
      { sando: '4. Big City Life - Smoked Salmon & Cream Cheese', price: 10.50 },
      { sando: '6. Bologna Baloney- Pistachio Mortadella', price: 11.00 },
      { sando: '7. Egg Slut Sando - Egg Salad', price: 8.50 }
    ]
    @icecream_menu = [
      { icecream: '8. Black & Gold - Tahini & Kharoub', price: 6.00 },
      { icecream: '9. Blueberry Hill - Blueberry Cheesecake', price: 5.50 },
      { icecream: '10. Strawberry Fields Forever - Strawberry & Cream', price: 5.50 },
      { icecream: '11. Cookie Thumper - Cookie Dough Vanilla Ice Cream', price: 5.50 },
      { icecream: '12. Watermelon Sugar - Watermelon Sorbet', price: 4.00 }, 
      { icecream: '13. Banana Pancakes - Banana & Peanut Butter', price: 5.50 }, 
      { icecream: '14. Lemon Tree - Amalfi Lemon Limoncello', price: 7.50 }  
    ]
  end

  def print_sando
    puts 'SANDO SELECTION'
    puts "-" * 60
    @sando_menu.each do |dish| 
      puts "• #{dish[:sando]} - #{dish[:price]}" 
    end
    puts "-" * 60
  end

  def print_icecream
    puts 'ICE CREAM SELECTION'
    puts "-" * 60
    @icecream_menu.each do |dish| 
      puts "• #{dish[:icecream]} - #{dish[:price]}" 
    end
    puts "-" * 60
  end
end

sc = Sandcream.new
p sc.sando_menu
# p sc.menu_list.map { |x| x[5]}
# print sc.menu_list.map { |x| x[1]}
# print sc.MENU.map { |x| x[1]}
# puts sc.menu_list[1][0]

# Sandos
# Submarine Club - Tuna Salad
# Clubster Cluck - Grilled Chicken
# Shrimpy Sea Chanty - Prawn Cockail 
# Sweet Home Avocado - All Veggie 
# Big City Life - Smoked Salmon & Cream Cheese
# Bologna Baloney- Pistachio Mortadella
# Egg Slut Sando - Egg Salad

# Ice Cream
# Black & Gold - Tahini & Kharoub
# Blueberry Hill - Blueberry Cheesecake
# Strawberry Fields Forever - Strawberry & Clotted Cream
# Cookie Thumper - Cookie Dough Vanilla Ice Cream 
# Watermelon Sugar - Watermelon Sorbet 
# Banana Pancakes - Banana & Peanut Butter 
# Lemon Tree - Amalfi Lemon Limoncello  
