class Dishes
#attr_reader :dish :list_of_dishes
  def initialize()
    @dish1 = nil
    @dish2 = nil
    @menu = {:dish => "£price"}
    @list_of_dishes = [{:dish1 => "£price1", :dish2 => "£price2", :dish3 => "£price3" }]
    @dish_selection = []
    @order = nil
end
  def check_takeawaydishes()
    puts "would you like to check the menu? (Y/N)"
    if gets.chomp = "Y"
    puts @list_of_dishes
  else puts "would you like to check the menu? (Y/N)"
    end
  def select_takeawaydishes(dish)
    puts "what would you like to order?"
    @dish_selection[:dish1] = @dish1
    @dish_selection[:dish3] = @dish3
  end
end
end
