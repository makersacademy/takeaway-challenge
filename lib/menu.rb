#Responsible for showing available dishes to select from.
require_relative 'dishes'


class Menu
    def available_dishes(dishes)
        available_with_nils = dishes.all_dishes.collect{|dish| "#{dish[:name]} - £#{dish[:price]}" if dish[:availability] == true}
        available_no_nils = available_with_nils.compact
        return available_no_nils
    end



    def select_dishes
    end
end
