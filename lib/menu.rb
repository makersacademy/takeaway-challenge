# I would like to see a list of dishes with prices
class Menu

  def initialize
    @menu_contents = {
      "chocolate cake" => 3.00,
      "brownie" => 1.00,
      "lemon drizzle" => 4.00
    }
    end

    def public_menu_contents
      @menu_contents.clone
    end

    def menu_display
       @menu_contents.each{|key, value| puts("#{key}"+ "---" + "£#{value}")}
    end

end
