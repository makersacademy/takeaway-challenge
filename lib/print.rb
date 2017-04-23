require_relative 'menu'
require_relative 'restaurant'
module Print

  def pretty_print_menu
    @menu.each { |k, v| puts "#{k}: £#{v}" }
  end
end
