class Menu

  attr_reader :food_list

  def initialize
    @food_list = {'Rainbow dumpling' => 28, 'Half crispy aromatic duck' => 39}
  end

  def send
    @food_list
  end

  def available?(item)
    @food_list.keys.include?(item)
  end

end