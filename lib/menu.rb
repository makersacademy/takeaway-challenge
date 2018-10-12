class Menu

  def initialize
    @list = {
      "Sweet and Sour Pork" => 8,
      "Satay Chicken" => 6,
      "Boiled Rice" => 2
    }
  end

  def list
    @list.dup
  end

  def view
    @list.map do |key, value|
      "#{key}, £#{value}"
    end.join("\n")
  end

end
