class Menu
  attr_reader :items

  def available_items
    @items = {:chips => 3, :rice => 2, :lamb_shish => 10, :chicken_shish => 10, :lamb_doner => 7, :soft_drink => 2, :nil => 0}
  end
end