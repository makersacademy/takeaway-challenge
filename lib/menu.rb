class Menu
attr_reader :display_array, :menu_array

  def initialize
    @display_array = ["Menu:"]
    @menu_array = []
    generate_menu
  end

  def display_menu
    @menu_array.each_with_index do |item, index|
      @display_array << "#{index+1}. #{item.to_a[0][0]} £#{'%.2f' % item.to_a[0][1]}"
    end
    @display_array.join("\n")
  end

  def generate_menu
    @menu_array = [{"Salad"=>1.00}, {"Soup"=>2.00}, {"Pasta"=>5.00}, {"Pizza"=>7.00}]
  end

end