class Menu
  attr_reader :list
  def initialize
    @list = [
      {:name => "panini", :cost => "2"},
      {:name => "biriyani", :cost => "3"},
      {:name => "cake", :cost => "4"}
    ]
  end

  # def select_dishes(item)
  #   @choosen_items = []
  #   @list.each do |dish|
  #     @choosen_items.push(item) if dish[:name] == item
  #   end
  #   return @choosen_items
  # end
end

