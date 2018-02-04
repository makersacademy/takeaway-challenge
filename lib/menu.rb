class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "Hui Guo Rou" => 4.25,
      "Yu Xiang Qie Zi" => 2.50,
      "Gan Guo Hua Cai" => 4.00,
      "Gong Bao Ji Ding" => 5.75,
      "Mapo DouFu" => 3.00
    }
  end

  def print_menu
    @dishes.each do |key, value|
      puts "#{key}: £#{'%.2f' % value}"
    end
  end

end
