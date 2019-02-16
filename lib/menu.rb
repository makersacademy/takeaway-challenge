require_relative('takeaway')

class Menu

  attr_reader :show_menu

  def initialize
    @show_menu = {'Vindaloo' => 6, 'Fish & Chips' => 7, 'Fries with that' => 1, 'Pictures of spiderman' => 200}
  end

  def show
    @show_menu.map do |dish, price|
      "#{dish} £#{price}"
    end.join(', ')
  end
end
