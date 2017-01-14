require 'takeaway'

describe Takeaway do
  subject(:t) {described_class.new}

  it 'returns a list of dishes and prices' do
    expect(t).to respond_to(:dishes)
  end

describe '#dishes' do
  it 'returns the menu' do
    menu = t.dishes
    menu.should include("Chips" => 0.99, "Mac'n'Cheese" => 3.50, "Pizza" => 3.50, "Cheeseburger" => 4.99, "Ice Cream" => 1.50)
  end
end

describe '#basket' do
  it 'returns the basket summary' do
end
end

end
