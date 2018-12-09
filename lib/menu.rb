class Menu

  attr_reader :menu

  def initialize
    @menu =  { 'Chicken Pie' => 5,
        'Beef Pie' => 6,
        'Liver Pie' => 3,
        'Steak and Kidney' => 3,
        'Chicken and Leak' => 6
      }
    end

  def show_menu
    menu_string = ""
    @menu.each { |key, value| menu_string << "#{key}: £#{value} \n" }
    menu_string
  end
end
