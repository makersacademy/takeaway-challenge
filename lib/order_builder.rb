# show available options
# calculate total

class OrderBuilder

  attr_reader :menu

def initialize
  @menu = {'Chicken chow mein' => 5.49,
          'Roast & toast' => 2.99,
          'Katsu wrap'=> 4.50,
          'Pret sandwich'=> 3.99,
          'Paella' => 5}
end

  def show_menu
    self.menu.each { |key, value| puts "#{key}.........£#{value}" }
  end



end
