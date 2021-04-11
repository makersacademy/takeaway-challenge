class Dishes
  attr_reader :name, :price, :available

  def initialize(name, price, available = true)
    $name = name
    $price = price
    @available = available
  end

  def available?(availability)
    if availability == "yes"
      $available = true
    elsif availability == "no"
      $available = false
    else
      $available
    end
  end

end