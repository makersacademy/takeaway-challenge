class Dish

  attr_accessor :price, :name 
  
  def initialize(options={})
    @name=options.fetch(:name, "")
    @price=options.fetch(:price, 1)
  end
    
end  