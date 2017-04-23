

class Menu

    attr_reader :list

    def initialize
      @list = {
        :chips =>1.99,
        :chicken_soup => 4.99,
        :pizza => 4.99
        }
      @menu_num = 1
    end

  def print_menu
    @list.each do |item, price|
     puts "#{@menu_num}. #{item} £#{price}"
      @menu_num += 1
    end
  end

end
