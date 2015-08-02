class Menu

  attr_reader :content

  def initialize
    @content = { chicken: 4, lamb: 7, vegetables: 3, latte: 2 }
  end

  def see_content
    puts "Dishes".ljust(10) + "Prices".rjust(10)
    puts "--------------------"
    content.keys.each { |x| puts (x.capitalize.to_s).ljust(10) + content[x].to_s.rjust(10) }
  end
end