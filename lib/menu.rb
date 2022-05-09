
class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      'pad thai' => 6.95,
      "green curry" => 8.95,
      "red curry" => 8.95,
      "nasi goreng" => 4.95,
      "prawn crackers" => 1,
      "rice" => 2
    }
  end

  def show_dishes
    dishes.map do |title, price|
      "%s £%.2f" % [title.to_s.capitalize, price]
    end.join(", ")
  end

end
