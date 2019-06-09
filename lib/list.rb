class List

attr_reader :menu

  def initialize
    @menu = { "chinese" => 10, "pierogi" => 8, "curry" => 9, "carbonara" => 11, "salad" => 6 }
    @recipt = 0
  end

  def show_menu
    @menu
  end

  def add_dish#(dish_name, quantity_of_dishes)
    # expect(list.key).to eq(key) key in the hash - this is imaginative draft

  end

  def show_finished_order_recipt
    @recipt
  end
end
