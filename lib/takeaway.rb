class Takeaway

  attr_reader :dishes, :basket

  def initialize # extract to require json file
    @dishes = { :starters => { 1 => { "Olives" => 4 } , 2 => { "Pitta bread" => 5 } }, :main_course => { 3 => { "Fried duck" => 12 }, 4 => { "Fish & Chips" => 9 } }, :dessert => { 5 => { "Jam roll" => 5 }, 6 => { "Apple crumble" => 6 } } }
    @basket = []
  end

  def lists_dishes_with_prices
     "Starters: #{extracts_starters} -- Main Course: #{extracts_main_course} -- Dessert: #{extracts_dessert}."
  end


  private

  def extracts_starters # refactor to avoid repetition
    starter1 = @dishes[:starters][1].map { |k, v| "#{k} = £#{v}" }.join(', ')
    starter2 = @dishes[:starters][2].map { |k, v| "#{k} = £#{v}" }.join(', ')
    "#{starter1}, #{starter2}"
  end

  def extracts_main_course
    main1 = @dishes[:main_course][3].map { |k, v| "#{k} = £#{v}" }.join(', ')
    main2 = @dishes[:main_course][4].map { |k, v| "#{k} = £#{v}" }.join(', ')
    "#{main1}, #{main2}"
  end

  def extracts_dessert
    desert1 = @dishes[:dessert][5].map { |k, v| "#{k} = £#{v}" }.join(', ')
    desert2 = @dishes[:dessert][6].map { |k, v| "#{k} = £#{v}" }.join(', ')
    "#{desert1}, #{desert2}"
  end

end

#I need people to choose from my dishes- create some kind of controller

# def select_dishes
#   puts "Welcome to our takeaway service. If you would like any starters please write in the name here, e.g. olives:"
#   starters = gets.chomp
#   puts "If you would like any main courses please write in the name here, e.g. fried duck:"
#   main_course = gets.chomp
#   puts "If you would like any desserts please write in the name here, e.g. jam roll:"
#   dessert = gets.chomp
#   puts "You have ordered: #{starters}, #{main_course}, #{dessert}."
#   @basket << [starters, main_course, dessert]
# end
