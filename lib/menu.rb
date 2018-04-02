class Menu

  attr_reader :list

  def initialize
    @list = { item1: 2, item2: 3, item3: 5, item4: 5, item5: 5 }
  end

  def read
    puts "Menu:"
    @list.each { |item, price| puts "#{item}: #{price}" }
  end

end
