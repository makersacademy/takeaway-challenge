require 'takeaway'

describe Takeaway do
  subject(:t) {described_class.new}

  it 'returns a list of dishes and prices' do
    expect(t).to respond_to(:dishes)
  end

describe '#dishes' do
  it 'returns the menu' do
    (t.dishes).should include("Chips" => 0.99, "Mac'n'Cheese" => 3.50, "Pizza" => 3.50, "Cheeseburger" => 4.99, "Ice Cream" => 1.50)
  end
end

describe '#order' do
  it 'takes an item of the menu, and its quantity, and places it in basket' do
    t.order("Chips", 2)
    (t.basket).should include("Chips x2 = £1.98")
  end
end

describe '#basket' do
  it 'returns the basket summary' do
    t.order("Chips", 2)
    t.order("Mac'n'Cheese", 3)
    (t.basket).should include("Chips x2 = £1.98, Mac'n'Cheese x3 = £10.50")
  end
end

end
