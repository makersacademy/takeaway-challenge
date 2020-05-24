require 'order'

describe Order do

  it 'creates a new instance of order' do
    expect(subject).to be_instance_of Order
  end

  it 'records the users order' do
    expect(subject).to respond_to(:add_to_order).with(2).arguments
  end

describe '#add_to_order' do

  it 'adds the users items to the basket' do
    subject.add_to_order("item", 2)
    expect(subject.basket).to eq({ "item" => 2 })
  end
end
end 
