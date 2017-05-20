class Takeaway

  attr_reader :menu, :basket
# TODO extract out to a separate menu class
  def initialize
    @menu = {   :starters => starters(),
                :main_course => main_course(),
                :dessert => dessert() }
    @basket = []
  end

  def starters
    { 1 => { "Olives" => 4 }, 2 => { "Pitta bread" => 5 } }
  end

  def main_course
    { 3 => { "Fried duck" => 12 }, 4 => { "Fish & Chips" => 9 } }
  end

  def dessert
    { 5 => { "Jam roll" => 5 }, 6 => { "Apple crumble" => 6 } }
  end

  def lists_dishes_with_prices
    "Starters: #{extracts_starters} -- Main Course: #{extracts_main_course} -- Dessert: #{extracts_dessert}."
  end

  def displays_controller
    puts "Welcome to our takeaway service. Please make your order by selecting 0 to be taken to the order controler"
  end

  #case statement where user selects what dish they want from the menu

  # def select_dishes
  #
  #   starters = gets.chomp
  #   puts "If you would like any main courses please write in the name here, e.g. fried duck:"
  #   main_course = gets.chomp
  #   puts "If you would like any desserts please write in the name here, e.g. jam roll:"
  #   dessert = gets.chomp
  #   puts "You have ordered: #{starters}, #{main_course}, #{dessert}."
  #   @basket << [starters, main_course, dessert]
  # end


  private

# TODO refactor to avoid repetition
  def extracts_starters
    starter1 = @menu[:starters][1].map { |k, v| "#{k} = £#{v}" }.join(', ')
    starter2 = @menu[:starters][2].map { |k, v| "#{k} = £#{v}" }.join(', ')
    "#{starter1}, #{starter2}"
  end

  def extracts_main_course
    main1 = @menu[:main_course][3].map { |k, v| "#{k} = £#{v}" }.join(', ')
    main2 = @menu[:main_course][4].map { |k, v| "#{k} = £#{v}" }.join(', ')
    "#{main1}, #{main2}"
  end

  def extracts_dessert
    desert1 = @menu[:dessert][5].map { |k, v| "#{k} = £#{v}" }.join(', ')
    desert2 = @menu[:dessert][6].map { |k, v| "#{k} = £#{v}" }.join(', ')
    "#{desert1}, #{desert2}"
  end

end
