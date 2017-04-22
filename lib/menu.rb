class Menu
  attr_reader :starters, :mains, :sides, :drinks

  def initialize
    @starters = [
      { "Battered squid" => "£5" }
    ]
    @mains = [
      { "Rump steak" => "£16" }
    ]
    @sides = [
      { "Chips" => "£2" }
    ]
    @drinks = [
      { "Merlot" => "£5"}
    ]
  end
end
