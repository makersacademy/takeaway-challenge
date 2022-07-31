require 'dish'

describe Dish do
  subject { Dish.new("chow_mein", 4.50) }
  
  it 'has a name' do
    expect(subject.name).to eq("chow_mein")
  end

  it 'has a price' do
    expect(subject.price).to eq(4.50)
  end
end
