require 'order_calculations'
describe OrderCalculations do
  subject(:order_calculations) { OrderCalculations }
  let(:dish) { double :dish }
  let(:order) { double :order }

  it 'should return the :number value from a hash when dish_number is called' do
    expect(order_calculations.dish_number({ dish: dish, number: 4 })).to eq 4
  end
  it 'should return the @price value from a :dish value in a hash when dis_price is called' do
    allow(dish).to receive(:price) { 7.5 }
    expect(order_calculations.dish_price({ dish: dish, number: 4 })).to eq 7.5
  end
  it 'should return total cost of order when calculate_total method is called with order object argument' do
    allow(order).to receive(:orderlines) { [{ dish: dish, number: 4 }] }
    allow(dish).to receive(:price) { 5 }
    expect(order_calculations.calculate_total(order)).to eq 20
  end
  it 'should return correct total cost of order when multiple dishes in order' do
    allow(order).to receive(:orderlines) { [{ dish: dish, number: 4 }, { dish: dish, number: 2 }] }
    allow(dish).to receive(:price) { 5 }
    expect(order_calculations.calculate_total(order)).to eq 30
  end
  it 'should raise error if order @total attribute does not equal value returned from calculate_total method' do
    allow(order).to receive(:orderlines) { [{ dish: dish, number: 4 }, { dish: dish, number: 2 }] }
    allow(dish).to receive(:price) { 5 }
    allow(order).to receive(:total) { 28 }
    expect { order_calculations.check_total(order) }.to raise_error("Total cost is incorrect")
  end
  it 'should return order if @total attribute equals value returned from calculate_total method' do
    allow(order).to receive(:orderlines) { [{ dish: dish, number: 4 }, { dish: dish, number: 2 }] }
    allow(dish).to receive(:price) { 5 }
    allow(order).to receive(:total) { 30 }
    expect(order_calculations.check_total(order)).to eq order
  end
end
