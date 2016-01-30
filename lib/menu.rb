class Menu
  attr_reader :dishes
  def initialize
    @dishes = {'prawn crackers' => 2,
               'ribs' => 4,
               'special fried rice' => 6,
               'singapore noodles' => 5,
               'duck pancakes' => 8,
               'beef satay' => 7,}
  end
end
