class Menu

  attr_reader :list

  def initialize(list = list)
    @list = list
  end

  def printed
   list.each_with_index do |dish, index|
     puts "#{index + 1}. #{dish[:dish]}: £#{dish[:price]}"
   end
  end

  def available?(selection)
    list.find{|dish| dish[:dish] == selection} != nil
  end

end
