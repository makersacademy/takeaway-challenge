require_relative 'menu'
class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = []
  end

  # TODO shorten this long line, e.g. print 3 x outputs for each course
  def lists_dishes_with_prices
    print "#{extracts_starters} #{extracts_main_course} #{extracts_dessert}"
  end

  # TODO refactor to avoid repetition- DRY 3's
  # TODO maybe create method for @menu.starters
  def extracts_starters
    starter1 = @menu.starters[1].map { |k, v| "#{k} = £#{v}" }.join(', ')
    starter2 = @menu.starters[2].map { |k, v| "#{k} = £#{v}" }.join(', ')
    starter1_key = @menu.starters.keys[0]
    starter2_key = @menu.starters.keys[1]
    print "Starters: #{starter1_key}. #{starter1}, #{starter2_key}. #{starter2} "
  end

  def extracts_main_course
    main1 = @menu.main_course[3].map { |k, v| "#{k} = £#{v}" }.join(', ')
    main2 = @menu.main_course[4].map { |k, v| "#{k} = £#{v}" }.join(', ')
    main1_key = @menu.main_course.keys[0]
    main2_key = @menu.main_course.keys[1]
    print "Main Courses: #{main1_key}. #{main1}, #{main2_key}. #{main2} "
  end

  def extracts_dessert
    dessert1 = @menu.dessert[5].map { |k, v| "#{k} = £#{v}" }.join(', ')
    dessert2 = @menu.dessert[6].map { |k, v| "#{k} = £#{v}" }.join(', ')
    dessert1_key = @menu.dessert.keys[0]
    dessert2_key = @menu.dessert.keys[1]
    print "Desserts: #{dessert1_key}. #{dessert1}, #{dessert2_key}. #{dessert2}"
  end

  # TODO shorten this long line, e.g. print 3 x outputs for each course
  # TODO work out how to do 0 and Q on controller menu & methods
  def displays_controller
    "Welcome to our takeaway service. Please make your order by selecting 0 to be taken to the selection menu, press 'Q' at anytime to escape the program:"
  end

  def selection_menu(choice)
    case choice
    when :starters
      starters_selection
    when :main_course
      main_course_selection
    when :dessert
      dessert_selection
    end
  end

  # TODO refactor all selection methods to avoid repetition - DRY 3's
  # TODO update with a loop to let them make 2 choices & push into basket
  def starters_selection
    displays_options(extracts_starters)
    starter = STDIN.gets.chomp
    @basket << [starter]
    displays_order_confirmation_message
  end

  # TODO update with a loop to let them make 2 choices & push into basket
  def main_course_selection
    displays_options(extracts_main_course)
    main = STDIN.gets.chomp
    @basket << [main]
    displays_order_confirmation_message
  end

  # TODO update with a loop to let them make 2 choices & push into basket
  def dessert_selection
    displays_options(extracts_dessert)
    dessert = STDIN.gets.chomp
    @basket << [dessert]
    displays_order_confirmation_message
  end

  # TODO line too long refactor
  def displays_options(menu_extract)
    "Please choose the order number for the dish you would like from the menu options: #{menu_extract}:"
  end

  # TODO customise this so the message confirms the order number(s) so customer is sure of what they ordered
  def displays_order_confirmation_message
    "Thanks for your selection we've added your orders to your basket."
  end

  def final_display_order_confirmation_message
    @balance.flatten
    "Thanks for your orders. Your order numbers are: #{@balance}"
  end


end
