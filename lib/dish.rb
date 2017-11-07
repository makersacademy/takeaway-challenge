require_relative 'methods'

class Dish
  attr_reader :name, :options

  def initialize(name, options_hash)
    @name = name
    @options = options_hash
  end

  def get_price(option_name)
    @options.each do |option, price|
      return price if symbol_to_string(option) == option_name.downcase
    end
  end
end
