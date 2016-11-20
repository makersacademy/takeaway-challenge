#Responsible for showing available dishes to select from.
require_relative 'dishes'


class Menu
    attr_reader :selected_dishes, :quantity, :dishes

    def initialize(dishes)
      @dishes = dishes
    end

    def print_menu
     (@dishes.all_dishes).each{|x|x.map{|key, value| puts "#{key} - £#{value}"}}
    end

    def available_dishes(choice)
    available =(@dishes.list).map{|hash|hash.select{|key,value| return true if key == choice}}
    if available != true then available = false end
    return available
    end

end
