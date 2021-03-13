require 'csv'

class Dishes
  attr_reader :dishes, :burgers

  def initialize
    @dishes = []
  end

  # def list_dishes
  #
  #   @burgers = [{name: "MexiCali Beef Burger", price: 12,
  #               allergens: "Gluten", prep_time:  5},
  #               {name: "The Burrito Burger", price: 15,
  #               allergens: "Gluten", prep_time:  10},
  #               {name: "El No Beef Burger", price: 15,
  #               allergens: "Gluten", prep_time:  10},
  #               {name: "Los' Tres Bean Burger", price: 11,
  #               allergens: "Gluten", prep_time:  10},
  #               {name: "Magic Bean Burger", price: 11,
  #               allergens: "Gluten", prep_time:  10},
  #               {name: "Mexican Chik'n Burger", price: 15,
  #               allergens: "Gluten", prep_time:  10},]
  #
  #  sides = [{name: "Stanky Fries", price: 7,
  #               allergens: "Mayonnaise", prep_time:  5},
  #               {name: "Nachos Libres", price: 9,
  #               allergens: "Dairy", prep_time:  10},
  #               {name: "Chilli Loaded Fries", price: 11,
  #               allergens: "Dairy", prep_time:  10},]
  #
  # return burgers
  # # return menu_item.collect {|burgers| "Name :#{burgers[:name]}"}
  # #   # -------> Price: #{burgers[:price]} }
  # end
  #
  #
  # def input_dishes
  #
  # end



  def load_menu
    @burgers = []
    header = nil
    CSV.foreach("burgers.csv", headers: true,
      header_converters: :symbol) do |row|
      header ||= row.headers
      burgers << row.to_h
      end
  end
end
