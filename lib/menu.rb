#Responsible for showing available dishes to select from.
require_relative 'dishes'
require_relative 'order'


class Menu
    attr_reader :selected_dishes, :quantity, :dishes

    def initialize(dishes)
      @dishes = dishes
    end

    def print_menu
     (@dishes.all_dishes).each{|x|x.map{|key, value| puts "#{key} - £#{value}"}}
    end

    def available_dishes(choice)
      self.dishes.list.any?{|item| item.include?(choice)}
    end
end
