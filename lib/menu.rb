class Menu

  def initialize
    @menu = {
      1 => ["Burger", 5.50]
    }
  end

  def print
    @menu.each { |number, dish| puts "#{number}: #{dish[0]}, £#{'%.02f' % dish[1]}\n" }
  end

end
