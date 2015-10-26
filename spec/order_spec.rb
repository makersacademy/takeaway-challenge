require './lib/order.rb'

describe Order do
  before 'each order do' do
    subject.start_order(:hawaiian_pizza, 3)
  end

  it 'can i choose an item an store it?' do
    expect(subject.current_order).to eq [{hawaiian_pizza: 7, no_of_item: 3, item_total: 21}]
  end
  it 'can hold an order for more than one of a certain item' do
    expect(subject.current_order).to eq [{hawaiian_pizza: 7, no_of_item: 3, item_total: 21}]
  end

  it 'can hold more than one item in the order' do
    subject.next_item(:spicy_chicken_pizza, 3)
    expect(subject.current_order).to eq \
    [{hawaiian_pizza: 7, no_of_item: 3, item_total: 21}, \
      {spicy_chicken_pizza: 8, no_of_item: 3, item_total: 24}]
  end

  it 'can produce an #order_total' do
    subject.next_item(:spicy_chicken_pizza, 3)
    subject.order_total
    expect(subject.collect_amount).to eq 45
  end

end
