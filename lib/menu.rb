class Menu

  attr_reader :list

  def initialize
    @list = {'tofu' => 3, 'broccoli' => 1, 'radish' => 2, 'seitan' => 5}
  end

  def display
    puts "Menu:"
    list.each {|i, d| puts "#{i}: £#{d}"}
  end

end
