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

# work out how to do 0 and Q on controller menu & methods
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
    starters = gets.chomp
    @basket << [starter]
    displays_order_confirmation_message
  end

# TODO update with a loop to let them make 2 choices & push into basket
  def main_course_selection
    displays_options(extracts_main_course)
    mains = gets.chomp
    @basket << [main]
    displays_order_confirmation_message
  end

# TODO update with a loop to let them make 2 choices & push into basket
  def dessert_selection
    displays_options(extracts_dessert)
    mains = gets.chomp
    @basket << [dessert]
    displays_order_confirmation_message
  end


  def displays_options(menu_extract)
    "The starters that we have available are #{menu_extract}:"
    "Please enter the order number you would like to add to your basket:"
  end

# TODO customise this so the message confirms the order number(s) so customer is sure of what they ordered
  def displays_order_confirmation_message
    "Thanks for your selection we've added your orders to your basket."
  end



  private

# TODO refactor to avoid repetition- DRY 3's
  def extracts_starters
    starter1 = @menu[:starters][1].map { |k, v| "#{k} = £#{v}" }.join(', ')
    starter2 = @menu[:starters][2].map { |k, v| "#{k} = £#{v}" }.join(', ')
    starter1_key = @menu[:starters].keys[0]
    starter2_key = @menu[:starters].keys[1]
    "#{starter1_key}. #{starter1}, #{starter2_key}. #{starter2}"
  end

  def extracts_main_course
    main1 = @menu[:main_course][3].map { |k, v| "#{k} = £#{v}" }.join(', ')
    main2 = @menu[:main_course][4].map { |k, v| "#{k} = £#{v}" }.join(', ')
    main1_key = @menu[:main_course].keys[0]
    main2_key = @menu[:main_course].keys[1]
    "#{main1_key}. #{main1}, #{main2_key}. #{main2}"
  end

  def extracts_dessert
    desert1 = @menu[:dessert][5].map { |k, v| "#{k} = £#{v}" }.join(', ')
    desert2 = @menu[:dessert][6].map { |k, v| "#{k} = £#{v}" }.join(', ')
    desert1_key = @menu[:dessert].keys[0]
    desert2_key = @menu[:dessert].keys[1]
    "#{desert1_key}. #{desert1}, #{desert2_key}. #{desert2}"
  end

end
