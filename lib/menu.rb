require_relative 'restaurant'
class Menu
  attr_reader :menu

  def initialize
    @menu = [{ "Battered squid" => "£5" }, { "Rump steak" => "£16" }, { "Chips" => "£2" },
      { "Merlot" => "£5"} ]
  end

end
