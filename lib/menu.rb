require_relative 'order'
require_relative 'send_sms'

class Menu

  attr_reader :all_dishes

  def initialize
    @all_dishes = [ {chicken_korma: 12}, {chicken_tika_masala: 11}, {rogan_josh: 10},
      {vegetable_briyani: 9}, {lamb_briyani: 10}, {naan_bread: 2}, {roti: 2},
      {cajun_pasta: 8}, {house_salad: 4}, {bologna: 5},
      {margarita_pizza: 9}, {vegetable_soup: 5}, {meat_pizza: 14}, {house_wine: 10},
      {duck_chowmein: 9}, {chicken_chowmein: 8}, {vegetable_noodles: 7},
      {shredded_duck: 8}, {spring_rolls: 2}, {dumplings: 5}, {prawn_crackers: 3},
      {fosters: 2}, {lemonade: 2}, {coke: 2}, {water: 1},
      {orange: 1}, {cocktail: 7}, {wine: 10} ]
  end

end
