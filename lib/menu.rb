class Menu

  attr_reader :info 

def initialize
  @info = {"Satay" => 5, "RotiCanai" => 9,"Kuih" => 3,"NasiLemak" => 10}
end

def read_menu
  @info.each do |key, value|
    puts "#{key}, $#{value}"
  end
end

def order(food)
  if @info.has_key?(food)
  p "You have added #{food} to your basket"
else
  p "This is Malaysian restaurant. We don't have that"
  end
end

end
