class Menu

  def initialize
    @italian_menu= {:pasta => 10,
      :pizza => 15,
      :risotto => 20}
  end

  def italian_menu
    @italian_menu
  end

  def print_menu
    @italian_menu.each { |k, v| puts "#{k}: #{v}"}
  end
end
