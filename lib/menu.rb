require 'json'

require_relative 'dish_filter'

class Menu
  include DishFilter

  attr_reader :dishes

  def initialize(path_to_config, file_reader = File, json_parser = JSON)
    json_data = file_reader.read(path_to_config)
    @dishes = json_parser.parse(json_data)
  end

  def pretty_dishes

    pretty_menu = ''

    for dish in @dishes
      dish_price = "%<price>.2f" % { price: dish["price"] }
      pretty_menu += "#{dish["id"]}.\t#{dish["name"]}\t£#{dish_price}\n"
    end

    pretty_menu.chomp
  end

  def get_dish(id)
    find_by_id(@dishes, id)
  end

end
