# Menu class
class Menu

  attr_reader :dish_list

  def initialize(item)
    @dish_list = []
    @item = item
    create_menu
  end

  # this will generate randomised items to add to our menu
  
  def create_menu
    25.times do
      @item.new((0..(2+ rand(8))).map { (97 + rand(25)).chr }.join(''), rand(5000))
      @dish_list.push(@item)
    end
  end

end
