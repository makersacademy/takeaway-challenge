class Dishes

  attr_reader :menu

  def initialize
    @menu = { "chow mein" => 2.99,
              "egg fried rice" => 1.99,
              "spring rolls" => 2.99
            }
  end

  def display_menu
    @menu.each { |key, value| "#{key}: £#{value}" }
  end

end