class Dishes
  attr_reader :list
  
  def initialize
    @list = { fish: 5, chips: 2, curry_sauce: 1 }
  end
  
  def view
    list.each do |key, value|
      puts "#{key} - £#{value}"
    end
  end
end
