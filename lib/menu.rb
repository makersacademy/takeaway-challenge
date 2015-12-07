require_relative 'meal'


class Menu

attr_reader :menu_string, :menu, :menu_hash, :menu_items,:menu_array

  def initialize(cs_string="CHICKEN CACCIATORE, £13.95, VEGGIE BURGER, £10.00,"\
    "TURKEY MILANESE, £13.50,GENNARO’S FAMOUS PORCHETTA, £13.95,"\
    "ITALIAN STEAK FRITES, £15.95, LAMB CHOPS SCOTTADITTO, £17.95,"\
    "HARISSA-SPICED AUBERGINE, £9.95")
    @menu_string = cs_string
    @menu_items = []
    @menu_array = []
  end

  def itemised
    menu_array = []
    menu_string.split(",").each {|x| menu_array << x.strip.lstrip  }
    menu_array.each_slice(2).to_a
      .each{|x,y| menu_items << MealItem.new(x,y) }
  end

  # def add_new_meal(meal = Meal.new)
  # #menu.rb
  # end
  #
  # def delete_meal(meal)
  # #menu.rb
  # end

end
