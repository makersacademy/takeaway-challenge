require_relative 'take_away'
class TakeAwayDisplay
attr_reader :takeaway
  def initialize
    @takeaway = TakeAway.new
  end

    def header
      puts "Tasty Bites of Makers Academy ".center(70)
      puts "------------------------------------".center(70)
      puts "\t 1. Check Menu"
      puts "\t 2. Take An Order"
      puts "\t 9. Exit"
      print "\t Please Enter you choice:\t#{process(gets.chomp)}"

    end
    def process(selection)
      loop do
      case selection
        when "1"
          @takeaway.display_menu
          break
        when "2"
          @takeaway.receive_order(gets.chomp)


        when "9"
          exit
        else
          puts "\n\tI don't know what you meant. try again"
        end # case
      end # => loop
    end



end # => TakeAwayDisplay class
