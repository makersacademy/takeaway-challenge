require 'order'

describe Order do
  it 'creates and instance of Order' do
    expect(subject).to be_an_instance_of Order
  end

  it 'creats an empty array basket' do
    expect(subject.basket).to be_empty
  end
end