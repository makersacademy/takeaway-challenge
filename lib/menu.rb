require 'yaml'

class Menu

  def initialize
    @chippy_menu
    @chinese_menu
  end

  def load_chippy_menu
    @chippy_menu = YAML.load_file('lib/chippy_menu.yml')
    display_menu(@chippy_menu)
  end

  def load_chinese_menu
    @chinese_menu = YAML.load_file('lib/chinese_menu.yml')
    display_menu(@chinese_menu)
  end

  def display_menu(menu)
    menu.each do |key, value|
      puts "#{key}".ljust(20) + "£#{value}".center(10)
    end
  end

end
