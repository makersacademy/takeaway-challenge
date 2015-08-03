require 'customer'

describe Customer do
  let(:menu) { double :menu, all_dishes: nil }
  let(:dish) { double :dish, price: 9.99 }
  let(:dish2) { double :dish, price: 12 }

  # select method is private

  xit 'allows customer to place order' do
    subject.place_order dish, 1
    expect(subject.orders.keys.first).to be dish
  end

  xit 'allows customer to remove order' do
    subject.place_order dish, 1
    subject.remove_order dish
    expect(subject.orders.count).to eq 0
  end

  # private methods

  xit 'tracks how many items are ordered' do
    expect(subject.quantity).to eq 1
  end

  xit 'knows the cost of the dish' do
    expect(subject.pricing(dish, 1)).to eq 9.99
  end

  xit 'knows the total price of the orders' do
    subject.place_order dish2, 1
    expect(subject.total).to eq 21.99
  end
end
