class Menu
  attr_reader :dishes

  def initialize
    @dishes = {"spring roll" => 0.99,
               "char sui bun" => 3.99,
               "pork dumpling" => 2.99,
               "peking duck" => 7.99,
               "fu-king fried rice" => 5.99}
  end

  def read
    p "Welcome to the UK's No.1 Dai Pai Dong!"
    print_menu
  end

  private

  def print_menu
    @dishes.each {|dish, price| p "#{dish}: £#{price}"}
  end
end
