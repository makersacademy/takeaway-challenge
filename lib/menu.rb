class Menu

  attr_reader :menu

  def initialize(menu_file = './lib/test.txt')
    @menu_file = menu_file
    @menu_array = []
  end

  def parse_file
    File.foreach(@menu_file) do |line|
      key, value = line.chomp.split(',')
      @menu_array << { name: key, cost: value.to_f }
    end
    @menu_array
  end
end
