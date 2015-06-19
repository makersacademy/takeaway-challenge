class Takeaway

  attr_reader :menu

  def initialize
    @menu = Hash['tempura', 8, 'okonomiyaki', 7, 'yakisoba', 6, 'gyoza', 3]
  end

  def show_menu
    @menu
  end

end