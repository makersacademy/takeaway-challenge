require 'order_calculations'
describe OrderCalculations do
  subject(:order_calculations) { OrderCalculations }
  let(:dish) { double :dish }
  let(:order) { double :order }

  it 'should return the :quantity value from a hash when dish_quantity is called' do
    expect(order_calculations.dish_quantity({ dish: dish, quantity: 4 })).to eq 4
  end
  it 'should return the @price value from a :dish value in a hash when dis_price is called' do
    allow(dish).to receive(:price) { 7.5 }
    expect(order_calculations.dish_price({ dish: dish, quantity: 4 })).to eq 7.5
  end
  it 'should return total cost of order when calculate_total method is called with order object argument' do
    allow(order).to receive(:orderlines) { [{ dish: dish, quantity: 4 }] }
    allow(dish).to receive(:price) { 5 }
    expect(order_calculations.calculate_total(order)).to eq 20
  end
  it 'should return correct total cost of order when multiple dishes in order' do
    allow(order).to receive(:orderlines) { [{ dish: dish, quantity: 4 }, { dish: dish, quantity: 2 }] }
    allow(dish).to receive(:price) { 5 }
    expect(order_calculations.calculate_total(order)).to eq 30
  end
  it 'should return false if order users total value does not equal @total value in order' do
    allow(order).to receive(:orderlines) { [{ dish: dish, quantity: 4 }, { dish: dish, quantity: 2 }] }
    allow(dish).to receive(:price) { 5 }
    allow(order).to receive(:total) { 30 }
    expect(order_calculations.check_total(28, order)).to eq false
  end
  it 'should return true if users total value does equal @total value in order' do
    allow(order).to receive(:orderlines) { [{ dish: dish, quantity: 4 }, { dish: dish, quantity: 2 }] }
    allow(dish).to receive(:price) { 5 }
    allow(order).to receive(:total) { 30 }
    expect(order_calculations.check_total(30, order)).to eq true
  end
end
