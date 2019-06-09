class Menu

  def get_menu
  { 
    "DAIFUKU" => 2,
    "ICHIGO"  => 3
  }
end

  def print_menu
    get_menu.map do |mochi, price|
      "#{mochi}, £#{price}"
    end
  end

end
