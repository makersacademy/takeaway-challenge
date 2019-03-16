require_relative 'takeaway'

# Menu class
class TakeawayMenu
  def initialize(takeaway = Takeaway.new)
    @takeaway = takeaway
    @contents = 1
    # print_menu(1)
  end

  def print_menu(menu)
    print_header
    fetch_contents(menu)
    @contents.each_with_index do |item, index|
      puts "| #{index + 1}. #{item}".ljust(81) + "|"
    end
    puts "-" * 82
  end

  def fetch_contents(contents)
    @contents = @takeaway.show(contents)
  end

  def print_header
    system 'clear'
    puts "-" * 82
    puts "|" + "Slice, Slice Baby!".center(80) + "|"
    puts "-" * 82
  end
end
