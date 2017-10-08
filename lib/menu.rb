class Menu

  attr_reader :dishes

  def initialize
    @dishes = { 'Pizza' => 8,
                'Pasta' => 6,
                'Salad' => 8,
                'Chips' => 3,
                'Burger'=> 9
              }
  end

  def show_dishes
    list = ''
    @dishes.each { |item, price| list += "#{item}: £#{price}\n" }
    list
  end

end
