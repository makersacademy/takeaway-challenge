require 'order'

describe Order do
  let(:food) { double :food}
  let(:quantity) {double :quantity}
  it 'orders food from menu' do
    expect(subject.order_food(food, quantity)).to eq [{:food => food, :quantity => quantity}]
  end


  it 'calculates total price of order' do
    subject.order_food(:pizza, 3)
    expect(subject.total_cost).to eq 9
  end
 
  it 'checks price is correct' do
    subject.order_food(:pizza, 3)
    expect(subject.is_correct_cost?(9)).to eq true
  end


  it 'raises an error when total_cost at checkout is incorrect' do
    subject.order_food(:pizza, 3)
    expect { subject.checkout(10) }.to raise_error "Incorrect total"
  end
end
