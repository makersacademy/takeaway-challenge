class Dishes

  def initialize
    @dishes = {
      'Pepperoni Pizza' => 5,
      'Bang Bang Chicken' => 6,
      'Pasta' => 4
    }
    @dishes_array = []
  end

  def display
    if @dishes_array == []
      format_dishes
    end
    @dishes_array
  end

  def format_dishes
    @dishes.each { |k,v|
      @dishes_array << "#{k} - £#{v}"
    }
  end

  private :format_dishes

end
