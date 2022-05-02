class Dishes

  def initialize
    @menu = [{ name: "Avocado On Toast", price: 5.50 }, 
      { name: "Poached Egg On Toast", price: 5.00 }, 
      { name: "Sliced Banana On Toast", price: 4.50 }, 
      { name: "Jam On Toast", price: 4.50 }, 
      { name: "Peanut Butter On Toast", price: 5.50 },
      { name: "Scrambled Eggs On Toast", price: 5.00 },
      { name: "Greek Yoghurt + Strawberries on Toast", price: 6.50 }]
  end

  def show_menu
    @menu
  end
end
