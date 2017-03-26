require 'csv'

class Menu # Displays takeaway menu with list of dishes with prices

    attr_reader :dishes

    def initialize(dishes)
      @dishes = dishes
    end

    def display
      takeaway_menu = CSV.foreach("lib/takeaway_menu.csv") do |row|
      puts row[0..2]
      end
    end

    def on_menu?(dish)
      raise 'Sorry, this dish is not available' if dishes.not_on_menu
      else 'This dish is available, you may order it.'
    end

    private

    def not_on_menu
    
    end

end
