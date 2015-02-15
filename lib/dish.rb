class Dish

  attr_accessor :price, :name 
  
  def initialize(options={})
    @name=options.fetch(:name, "")
    @price=options.fetch(:price, 0)
  end
   
  def self.curry
    new :name => :curry, :price => 10
  end  

  def self.pasta
    new :name => :pasta, :price => 20
  end  

  def self.pizza
    new :name => :pizza, :price => 30    
  end  

  def self.burger
    new :name => :burger, :price => 40
  end

end  