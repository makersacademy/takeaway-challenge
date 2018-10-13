require 'order'

describe Order do
  it "selects some available options" do
    subject.select("Small Margarita", "Medium Pepperoni")
    expect(subject.order).to eq []
  end

  it 'returns the price of all the chosen items' do
    #give list of items and a price 
    expect(subject.price).to #equal sum of all prices
  end
end
