class Takeaway

  attr_accessor :menu

  def initialize
    @menu = { 'Chicken Pie' => 5,
        'Beef Pie' => 6,
        'Liver Pie' => 3,
        'Steak and Kidney' => 3,
        'Chicken and Leak' => 6
      }
    end

  def show_menu
    @menu.each { |key, value| puts "#{key}: £#{value} \n" }
  end
end
