class Menu

	 attr_reader :dishes

  def initialize(dishes)
    @dishes = dishes

    # {
    #  		"spring roll" => 0.99, "char sui bun" => 3.99,
    #  	 	"pork dumpling" => 2.99, "peking duck" => 7.99, 
    #  	 	"fu-king fried rice" => 5.99
    #  	}
   end

  def print
    dishes.map do |title, price|
      "%s £%.2f" % [title.to_s.capitalize, price]
    end.join(", ")
  end
end

