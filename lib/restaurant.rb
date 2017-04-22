require_relative 'menu'
class Restaurant
  attr_reader :menu

  def initialize
    @menu = [{"Battered squid" => 5}, {"Rump steak" => 16}, {"Chips" => 2}, {"Merlot" => 5}]
  end

  def pretty_print
    return @menu.each do |a|
      a.each { |k, v| "#{k}: £#{v}" }
    end
  end

  def show_menu
    @menu
  end

end
