class Menu

  attr_reader :dishes

  def initialize
    @dishes = {'Korma': 4.95, 'Red Curry': 5.95, 'Green Curry': 6.95}
  end

  def show_menu
    @dishes.each { |k, v| "#{k}: £#{v}" }
  end

end