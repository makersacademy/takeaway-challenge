require_relative 'menu'
class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = []
  end

  def lists_dishes_with_prices
    print "#{extracts_starters} #{extracts_main_course} #{extracts_dessert}"
  end

  # TODO refactor to avoid repetition- DRY 3's - plus each method is doing too much
  # TODO should this be in the menu class not the takeaway class?
  def extracts_starters
    starter1 = menu_starters[1].map { |k, v| "#{k} = £#{v}" }.join(', ')
    starter2 = menu_starters[2].map { |k, v| "#{k} = £#{v}" }.join(', ')
    starter1_key = menu_starters.keys[0]
    starter2_key = menu_starters.keys[1]
    print "Starters: #{starter1_key}. #{starter1}, #{starter2_key}. #{starter2} "
  end

  def extracts_main_course
    main1 = menu_main_course[3].map { |k, v| "#{k} = £#{v}" }.join(', ')
    main2 = menu_main_course[4].map { |k, v| "#{k} = £#{v}" }.join(', ')
    main1_key = menu_main_course.keys[0]
    main2_key = menu_main_course.keys[1]
    print "Main Courses: #{main1_key}. #{main1}, #{main2_key}. #{main2} "
  end

  def extracts_dessert
    dessert1 = menu_dessert[5].map { |k, v| "#{k} = £#{v}" }.join(', ')
    dessert2 = menu_dessert[6].map { |k, v| "#{k} = £#{v}" }.join(', ')
    dessert1_key = menu_dessert.keys[0]
    dessert2_key = menu_dessert.keys[1]
    print "Desserts: #{dessert1_key}. #{dessert1}, #{dessert2_key}. #{dessert2}"
  end

  # TODO refactor to avoid repetition- DRY 3's
  # TODO should this be in the menu class not the takeaway class?
  def menu_starters
    @menu.starters
  end

  def menu_main_course
    @menu.main_course
  end

  def menu_dessert
    @menu.dessert
  end

  def print_menu
    puts "1. Order Starters"
    puts "2. Order Main courses"
    puts "3. Order Desserts"
    puts "4. Show order selections"
    puts "5. Exit"
  end

  def process_menu(selection)
    case selection
    when "1"
      order_starters
    when "2"
      order_mains
    when "3"
      order_desserts
    when "4"
      show_selections
    when "5"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you mean, try again"
    end
  end

end
