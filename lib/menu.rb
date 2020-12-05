class Menu

  attr_reader :contents

  MEALS = {
    "chicken curry" => 12,
    "lasagne" => 14,
    "pepperoni pizza" => 13,
    "burger and chips" => 12,
    "guinness stew" => 11,
    "braised pork belly" => 15
  }

  def initialize(contents = MEALS)
    @contents = contents
  end

  def view_menu
    @contents.each { |dish, price| puts "#{dish}: #{price}" }
  end

end
