class Menu

attr_reader :dishes

  def initialize
    @dishes = {
      pizza: 10,
      pasta: 5,
      gnocchi: 12
                }
  end

  def add meal, price
    @dishes[meal] = price
  end

  def show_menu
    @dishes.each {|k,v| puts "#{k}: £#{v}"}
  end

end
