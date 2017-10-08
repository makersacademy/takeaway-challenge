class Basket

attr_reader :basket_contents

  def initialize
    @basket_contents = []
  end

  def new_item(item)
    @basket_contents << item
  end
end
