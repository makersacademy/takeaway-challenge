class Order

# will need to be an array of hashes - dish name and price
  def initialize
    @list = []
  end

  def view
    @list.dup
  end

  def add(dish)
    @list.push(dish)
  end

  private

  # check dish on menu

  # check dish available

  # add up prices

  # print list

end
