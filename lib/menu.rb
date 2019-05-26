class Menu
  def initialize(dishes)
    @dishes = dishes
  end

  def available?(dish)
    @dishes.has_key?(dish)
  end

  def get(dish)
    @dishes[dish]
  end

  def list
    @dishes.values.reduce('') do |memo, dish|
      "#{memo}#{dish.to_s}\n"
    end
  end
end