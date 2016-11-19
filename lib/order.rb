class Order

  attr_reader :selection

  def initialize
    @selection = []
  end

  def select_items
    puts "Please select your items by item number. To finish please type 'end'."
    while items = gets.chomp.downcase
      case items
      when "end"
        puts "Thank you!"
        break
      else
        selection << items.to_i
      end
    end
  end

end
