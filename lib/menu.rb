class Menu

  attr_reader :dishes

  def initialize
    @dishes = [{:name => 'Red curry', :price => 5.95, :spicy => 'V hot!'}, {:name => 'Green curry', :price => 6.95, :spicy => 'V V hot!'}]
  end

  def show_menu
    @dishes.each { |k| "Name: #{k[:name]}; Price: #{k[:price]}; Spicy?: #{k[:spicy]}" }
  end

end