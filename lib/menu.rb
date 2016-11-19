#Responsible for showing available dishes to select from.
require_relative 'dishes'


class Menu

    def output_dishes(dishes)
      available_dishes(dishes).each_with_index do |dish,index|
        puts "#{index+1}. #{dish}"
      end
    end

    def select_dishes(*numbers)


    end


    private

    def available_dishes(dishes)
        available_with_nils = dishes.all_dishes.collect{|dish| "#{dish[:name]} - £#{dish[:price]}" if dish[:availability] == true}
        available_no_nils = available_with_nils.compact
        puts available_no_nils
        return available_no_nils
    end
end
