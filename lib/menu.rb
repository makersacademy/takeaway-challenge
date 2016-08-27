class Menu

attr_reader :list


  def initialize
    @list = [
      { "King's o Wings" => 15},
      {"Poulet Hermite" => 3},
      {"Jack' Very Best" => 5}
    ]
  end

  def print_menu
    puts "Welcome to Jack's Wack".center(70)
    puts ""
    @list.each do |item|
      item.each do |k, v|
          puts "#{k}: £#{v} (Delivery included)".center(70)
        end
      end

  end



end
