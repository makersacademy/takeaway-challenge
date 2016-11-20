#Responsible for showing available dishes to select from.
require_relative 'dishes'


class Menu
    attr_reader :selected_dishes

    def initialize
      @selected_dishes = []
    end

    def output_dishes(dishes)
      wo_index = available_dishes(dishes).collect do |dish|
        "#{dish[:name]} - £#{dish[:price]}"
      end
      w_index =wo_index.each_with_index{|dish,index| "#{index+1}. #{dish}"}
    end

    def select_dish(dishes,number)
      @selected_dishes << available_dishes(dishes)[number-1]

   #### ^^^^ selects the index of the hash in available_dishes

    end


    private

    def available_dishes(dishes)
        available_with_nils = dishes.all_dishes.collect{|dish| dish if dish[:availability] == true}
        available_no_nils = available_with_nils.compact
        return available_no_nils
    end

    def get_something
      gets.chomp
    end
end
