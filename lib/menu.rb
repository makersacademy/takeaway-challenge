class Menu

  attr_reader :dishes

  DEFAULT_DISHES = {
    'Cockroach Clusters' => 4.99,
    'Maggoty Haggis' => 3.99,
    'Rock Cakes' => 6.99,
    'Stoat Sandwiches' => 4.50,
    'Chocolate Frogs' => 3.79,
    'Pumpkin Pasties' => 3.60,
    'Bouillabaisse' => 13.40,
  }

  def initialize(dishes = DEFAULT_DISHES)


    @dishes = dishes
  end

  # def print
  #   #items.each do |k,v|
  #     #@stream.puts "#{k}: #{v}"
  # => end
  #   #print each dish and price
  # end

end

#this class now has a reason to change
#but it now has a responsibility to work
#with any object that has a puts
