require 'dishes'

describe Dishes do
  
  let :list_of_dishes do
    [
      {name: 'sushi', price: 20.49}
    ]
  end

  it 'check that dishes has a hash of dishes with prices' do
      expect(subject).to respond_to(:list)
  end

  it 'has a list of dishes and prices' do
    expect(subject.list).to eq list_of_dishes
  end

end