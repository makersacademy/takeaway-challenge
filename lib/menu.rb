class Menu

  def menu
    @menu = { "Green Curry" => 6,
              "Massaman Curry" => 6,
              "Panang Curry" => 6,
              "Pad Thai" => 7,
              "Rice" => 2,
              "Pad Pak" => 3,
              "Singha" => 4 }
  end

  def view_menu
    menu.each do |item, price|
      puts "#{item}: £#{price}"
    end
  end

end
