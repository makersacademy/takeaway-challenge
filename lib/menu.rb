class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      1 => ["Hui Guo Rou          ", 4.25],
      2 => ["Yu Xiang Qie Zi      ", 2.50],
      3 => ["Gan Guo Hua Cai      ", 4.00],
      4 => ["Gong Bao Ji Ding     ", 5.75],
      5 => ["Mapo DouFu           ", 3.00]
    }
  end

  def print_menu
    @dishes.each do |key, value|
      puts "#{key}: #{value[0]} £#{'%.2f' % value[1]}"
    end
  end

end
