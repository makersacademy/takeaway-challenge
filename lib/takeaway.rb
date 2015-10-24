class Takeaway
  def initialize
    @menu_file = 'menu-file.txt'
  end

  def menu
    File.read(menu_file).each_line do |line|
      puts line
    end
  end

  private
  attr_reader :menu_file
end
