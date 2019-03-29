require 'total'

describe TotalCost do
  it 'calculates total cost of order' do
    subject.calc([{food: 1, quantity: 1}])
    expect(subject.total_cost).to eq 8
  end

  it 'totals multiple orders' do
    order = [{food: 1, quantity: 1}, {food: 5, quantity: 1}, {food: 9, quantity: 1}]
    subject.calc(order)
    expect(subject.total_cost).to eq 12
  end

end
