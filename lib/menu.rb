require_relative 'takeaway'

class Menu

  attr_reader :dishes

  def initialize(dishes = { "Prawn Crackers" => 1.51, "Prawn Gyoza" => 3.51,
     "Chicken Gyoza" => 3.11, "Spring Rolls" => 3.15 })
    @dishes = dishes
  end

  def print
    @dishes.map do |k, v|
      "#{k} - £#{v}"
    end.join(", ")
  end

end
