require 'order'
describe Order do 
  let (:pasta){double :dish, name: 'pasta', price: 6}
  let (:order){Order.new}
  it 'has no dishes when initialized' do 
    expect(order.meals).to be_empty
  end
  it 'can add order dish with quantity' do 
    expect(order.meals).to be_empty
    order.add pasta, 2
    expect(order.meals).to eq [pasta,pasta]
  end
  it 'can calculate the total cost of the meals' do 
    order.add pasta, 3
    expect(order.total).to eq 18
  end
end