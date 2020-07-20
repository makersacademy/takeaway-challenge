class Menu
  attr_reader :list, :prices

  def initialize

    @starters = {"Bean soup" => 6.00,
    "Asparagus" => 4.50}

    @main_courses = {"Hamburger" => 14.00,
    "Chef's salad" => 10.00,
    "Club sandwiches" => 12.00}

    @sides = {"Fries" => 5.50,
    "Onion rings" => 6.50,
    "Cheese platter" => 12.00,
    "Steamed vegetables" => 4.50}

    @categories = [@starters, @main_courses, @sides]
    @list = []
    @prices = []
  end
    
  def display
    items_count = 1
    display_header = 0
    @categories.each do |category|
      header(display_header)
      display_header += 1
      category.each do |dish, price|
        puts "#{items_count}. #{dish} : €#{price}."
        @list << "#{items_count}. #{dish}: €#{price}."
        @prices << price
        items_count += 1
      end
    end
    footer
  end

  def header(display_header)
    menu_headers = ["STARTERS", "MAIN COURSES", "SIDES"]
    puts ""
    puts "#{menu_headers[display_header]}"
    puts "---------------"
  end

  def footer
    puts ""
    puts "---------------"
  end
end