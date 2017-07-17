require "./lib/takeaway.rb"
class Welcome

  def initialize
    @welcome = welcome
    @select_choice = select_choice
  end

  def select_choice
  @takeaway = Takeaway.new 
    puts "Please select:"
    answer = gets.chomp
    case answer
      when "1"
        @takeaway.menu
      when "2"
        @takeaway.select_from_menu
      when "3"
        @takeaway.check_out
      when "9"
        exit
      else
        puts "Unknown selection, try again"
      end
  end

  def welcome
      puts "1. see menu"
      puts "2. select dishes from menu"
      puts "3. check out and pay"
      puts "9. exit"
      loop do
          select_choice
      end
  end

end
