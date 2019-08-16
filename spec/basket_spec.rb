require 'basket'

describe Basket do
  let(:dish) { double(:dish, price: 2) }
  it 'can add a dish' do
    subject.add(dish)
    expect(subject.dishes).to include(dish)
  end
  it 'can empty itself' do
    subject.add(dish)
    subject.empty
    expect(subject.dishes).to be_empty
  end
  it 'provides a subtotal price' do
    3.times { subject.add(dish) }
    expect(subject.total).to eq(6)
  end
end
