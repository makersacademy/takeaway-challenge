#require 'yaml'

class Menu

  attr_reader :options

  #loaded_options = YAML.load_file('menu.yml')

  def initialize(options)
    @options = options
  end


  def show
    options.collect do |names, prices|
      "#{names.to_s.capitalize} £#{"%.2f" % [prices]}"
    end.join(", ")
  end

  def has_option?(option)
    !options[option].nil?
  end

  def price(option)
    options[option]
  end

end
