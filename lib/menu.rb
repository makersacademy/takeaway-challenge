class Menu

  def initialize
    @menu = [
      { name: "Butterbeer", price: "3" }
    ]
  end

  def see
    menu.each_with_index do |dish, index|
      puts "#{index + 1}. #{dish[:name]}: #{dish[:price]} sickles"
    end
  end

  # def choose
  #
  # end

  private

  attr_reader :menu
end
