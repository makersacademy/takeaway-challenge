class Menu
  attr_accessor :dishes
  
  def initialize
    @dishes = {}
  end

  def add(dishes)
    arr = dishes.split(", ")
    @dishes.merge!(Hash[arr.each_slice(2).to_a])
  end

  def list
    @dishes.each_with_index do |(key, value), index|
      puts "#{index + 1}- #{key} £#{value}"
    end
  end
end
