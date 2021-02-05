class Takeaway 

  attr_reader :menu_hash

  def initialize 
    @menu_hash = { 'Mixed Starter' => 7,
    'Yuk Sung' => 6.4,
    'Prawn Cocktail' => 3.7 } 
  end

  def print_menu
    @menu_hash.each do |food, price|
      puts "#{food} : £%.2f" % price
    end
  end
end