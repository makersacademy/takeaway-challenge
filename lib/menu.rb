require 'json'

class Menu

  attr_reader :dishes

  def initialize(path_to_config, file_reader = File, json_parser = JSON)
    json_data = file_reader.read(path_to_config)
    @dishes = json_parser.parse(json_data)
  end

end