require 'dish'

describe Dish do
  it { is_expected.to respond_to(:see_list) }
  
  it 'has a price' do
    expect(subject.price).to eq @price
  end

  # it 'initializes with a price' do
  #   expect 
  # end
end