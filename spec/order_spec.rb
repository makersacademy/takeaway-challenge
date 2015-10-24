require './lib/order.rb'

describe Order do
  it 'can i choose an item an store it?' do
    subject.start_order(:hawaiian, 3)
    expect(subject.current_order).to eq [{hawaiian: 7, item_no: 3}]
  end
  it 'can hold an order for more than one of a certain item' do
    subject.start_order(:hawaiian, 2)
    expect(subject.current_order).to eq [{hawaiian: 7, item_no: 2}]
  end

  it 'can hold more than one item in the order' do
    subject.start_order(:hawaiian, 2)
    subject.next_item(:spicy_chicken, 3)
    expect(subject.current_order).to eq \
    [{hawaiian: 7, item_no: 2}, {spicy_chicken: 8, item_no: 3}]
  end

end
