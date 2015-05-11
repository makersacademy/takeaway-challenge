class Dishes

  attr_accessor :dish_list

  def initialize
    @dish_list = {
      :FishAndChips => 5,
      :MeatAndTwoVeg => 7
    }
  end

  def new_dish item, price
    @dish_list[item] = price
  end

  def change_price existing_item, price
    @dish_list[existing_item] = price
  end
end