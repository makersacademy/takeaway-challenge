class Menu

attr_reader :list


  def initialize
    @list = { wings: 12,
              chicken: 9,
              special: 15}
  end

  def print_menu
    puts "+++MENU+++".center(70)
    @list.each do |k, v|
          puts "#{k}: £#{v}".center(70)
      end
  end
end
