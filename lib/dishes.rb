class Dishes

  attr_reader :list

  def initialize
    @list = [
      { name: 'Tuna', price: 7.99 }, 
      { name: 'Spanish Mackerel', price: 6.54 }, 
      { name: 'Sweet Shrimp', price: 12.49 }, 
      { name: 'Saltwater Eel', price: 15.54 }, 
      { name: 'Round Clam', price: 15.44 }, 
      { name: 'Albacore White Tuna', price: 3.25 }, 
      { name: 'Skipjack Tuna', price: 5.44 }, 
      { name: 'Tiger Shrimp', price: 2.99 }, 
      { name: 'Butterfish', price: 28.22 }, 
      { name: 'Yellow Tail', price: 11.88 }, 
      { name: 'Yellowtail Belly', price: 1.99 }, 
      { name: 'Halibut', price: 6.44 }, 
      { name: 'Surf Clam', price: 8.44 }
    ]
  end


end
