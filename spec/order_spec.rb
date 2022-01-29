require 'order'

describe Order do
  
  let(:dish) { double :dish, :name => "Pizza", :price => 5 }
  it 'has a default total of 0' do
    expect(subject.total).to eq 0
  end

  it 'is empty by default' do
    expect(subject.items).to be_empty
  end

  it 'can add items to the order' do
    subject.add(dish)
    expect(subject.items).to include("Pizza = £5")
  end

  it 'updates the total with each added item' do
    subject.add(dish)
    expect(subject.total).to eq (5)
  end

end
