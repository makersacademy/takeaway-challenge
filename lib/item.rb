class Item

  attr_reader :id, :name, :price, :category

  def initialize(arr)
    @id, @name, @price, @category = arr
  end
    
end
