class Menu
  MENU = [
    { :food => 'vegetarian', :price => 4 },
    { :food => 'chicken', :price => 5 },
    { :food => 'beef', :price => 5.5 },
    { :food => 'pizza', :price => 6.5 },
    { :food => 'risotto', :price => 6 },
    { :food => 'rice side dish', :price => 1.5 },
    { :food => 'vegetables side dish', :price => 1.5 }
  ]

  def view_menu
    MENU.each do |hash|
      puts "#{hash[:food]}: #{hash[:price]}"
    end
  end

end
