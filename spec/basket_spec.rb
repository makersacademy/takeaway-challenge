require 'basket'

describe Basket do

  it 'responds to .add' do
    expect(subject).to respond_to(:add)
  end
  it 'can add dishes to basket' do
    dish = { name: "Pizza", price: 20 }
    expect(subject.add(dish).pop[:name]).to eq "Pizza"
  end

end
