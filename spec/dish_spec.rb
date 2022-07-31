require 'dish'

describe Dish do
  
  it 'has a price' do
    expect(subject.price).to eq @price
  end

end
