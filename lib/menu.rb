class Menu
  attr_reader :italian_menu
  def initialize
    @italian_menu= {:pasta => 10,
      :pizza => 15,
      :risotto => 20}
  end

  def header
    "Ciao, welcome to Nero's Pizzeria"
  end

  def footer
    "A presto!"
  end

  def print_menu
    @italian_menu.each { |k, v| puts "#{k}: #{v}"}
  end
end
