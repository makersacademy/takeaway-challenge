class Menu

  attr_reader :menu

  def initialize
    @menu = {
    :pizza => 5,
    :fish => 7,
    :chips => 2,
    :kebab => 5,
    :curry => 7,
    }

  end

  def display
    num = 1
    @menu.each do |dish, value|
    puts "#{num}. #{dish} - £#{value}"
      num += 1
    end
  end

end
