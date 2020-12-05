require 'order'

describe Order do
  it 'can create an instance of order' do
    expect(subject).to be_kind_of(Order)
  end

  it 'can respond to add_to_order' do
    expect(subject).to respond_to(:add_to_order)
  end

  it 'will check the order history' do
    expect(subject.order_array).to eq []
  end

  it 'will respond to item_exists?' do
    expect(subject).to respond_to(:item_exists?)
  end

  it 'will raise an error if item does not exist' do
    message = 'That is not on the menu!'
    expect { subject.add_to_order('cheese') }.to raise_error message
  end

  it 'will allow the customer to order several different items' do
    subject.add_to_order("1 Chip", 1)
    subject.add_to_order("Pea", 1)
    expect(subject.order_array).to eq([{"1 Chip" => 90 }, {"Pea" => 200}])
  end

  it 'will allow the customer to order several of the same items' do
    subject.add_to_order("1 Chip", 2)
    expect(subject.order_array).to eq([{"1 Chip" => 90 }, {"1 Chip" => 90}])
  end

  it 'will respond to view_order' do
    expect(subject).to respond_to(:view_order)
  end

  it 'will display the order for the customer' do
    subject.add_to_order("1 Chip")
    expect(subject.order_array).to eq([{"1 Chip" => 90 }])
  end
end
