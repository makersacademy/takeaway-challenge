require_relative "order"

class Dishes

  # attr_reader :list

  def initialize
    @list = []
    
  end

  def list
    @list = [
      { :name => "Pizza", :price => 15 },
      { :name => "Burger", :price => 12 },
      { :name => "Salad", :price => 10 }
    ]

    @list.each do |dish|
      puts "#{dish[:name]}: £#{dish[:price]}"
    end
  end

end
