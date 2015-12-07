class Menu
  MENU = {'Spring Rolls' => 2.99, 'Crispy Duck' => 6.99}
  SPACERS = 29

  def raw
    MENU
  end

  def format
    MENU.reduce("") do |result, (key, value)|
      dots = SPACERS - (key.length + (value.to_s.split("").size))
      result + key + ('.' * dots) + '£' + value.to_s + "\n" 
    end
  end
end
