require 'dishes'

describe Dishes do

  it 'displays list of dishes with prices' do
    expect(subject.display).to eq ["Pepperoni Pizza - £5", "Bang Bang Chicken - £6", "Pasta - £4"]
  end

  it 'selects a dish and quantity' do
    expect(subject.choose('None', 0)).to eq []
  end

end
