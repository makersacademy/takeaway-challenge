class Menu
  attr_reader :dishes

  def initialize
    @dishes = {"spring roll"=>0.99,
      "char sui bun"=>3.99,
      "pork dumpling"=>2.99,
      "peking duck"=>7.99,
      "fu-king fried rice"=>5.99}
  end

  def print
    dishes.each do |dish, price|
      string = "#{dish}\n £#{price}"
      puts string

    end
  end
end

menu = Menu.new
