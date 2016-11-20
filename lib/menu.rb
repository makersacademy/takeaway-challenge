#Responsible for showing available dishes to select from.
require_relative 'dishes'


class Menu
    attr_reader :selected_dishes, :quantity

    def initialize(dishes)
      @dishes = dishes
    end


    def available_dishes(choice)
    available =(@dishes.list).map{|hash|hash.select{|key,value| return true if key == choice}}
    if available != true then available = false end
    return available
    end

end
