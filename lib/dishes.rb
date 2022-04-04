class Dishes

  attr_reader :list

  def initialize
    @list = { 'Tuna' => 7.99,
        'Spanish Mackerel' =>  6.54,
        'Sweet Shrimp' =>  12.49,
        'Saltwater Eel' =>  15.54,
        'Round Clam' =>  15.44,
        'Albacore White Tuna' =>  3.25,
        'Skipjack Tuna' =>  5.44,
        'Yellow Tail' =>  11.88 }
  end

  def check(item)
    price = list.fetch_values(item).join().to_f
    puts "Your chosen food item is #{item} and it costs #{price}."
    price
  end

end
