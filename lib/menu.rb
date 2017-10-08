class Menu

  attr_reader :dishes

  def initialize
    @dishes = { 'pizza' => 8,
                'pasta' => 6,
                'salad' => 8,
                'chips' => 3,
                'burger'=> 9
              }
  end

  def show_dishes
    list = ''
    @dishes.each { |item, price| list += "#{item}: £#{price}\n" }
    list
  end

end
