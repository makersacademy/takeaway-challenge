
class Menu

  def initialize
    @menu = {"Regular Burger" => {description: "standard hamburger", price: 5.00, available: true},
      "Special Burger" => {description: "marinated in orphen's tears", price: 5.95, available: false},
      "Cheese Burger" => {description: "regular burger with cheese", price: 5.50, available: true},
      "Fries" => {description: "skinny fries", price: 2.00, available: true},
      "Side Salad" => {description: "little gem lettuce and baby spinich, with a ceaser dressing", price: 2.50, available: true},
      "Soft Drink" => {description: "coke, fanta, tango", price: 2.00, available: true},
      "Beer" => {description: "Hobgoblin Ruby or Dead Pony IPA", price: 4.00, available: true}}
  end

    def print
      menu = @menu.map{|item, value| "#{item}, £%.2f\n#{value[:description]}\n\n" % value[:price]}
      menu.join
    end

    def available? item
      item = clean(item)
      raise "#{item} not on the menu" if @menu[item] == nil
      return false if @menu[item][:available] == false
      {name: item}.merge(@menu[item])
    end

    private

    def clean(item)
      item.split(" ").map{|i| i.capitalize}.join(" ").chomp
    end
end