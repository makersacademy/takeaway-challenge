class Menu

  attr_reader :menu

  def initialize(menu_file='./lib/test.txt')
    @menu_file = menu_file
    @menu = []
  end

  def get_menu
    File.foreach(@menu_file) do |line|
      key, value = line.chomp.split(',')
      @menu << { item: key, cost: value.to_f }
    end
  end
end
