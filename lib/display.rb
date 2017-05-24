require 'menu'

class Display

  def read_input
    STDIN.gets.chomp
  end

  def displays_menu(menu)
    print "#{menu.extracts_starters} #{menu.extracts_main_course} #{menu.extracts_dessert}"
  end

end
