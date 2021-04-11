require 'calculator'

describe Calculator do
  let(:order) { [1, 2, 3, 4, 5] }
  it 'calculates the total price' do
    expect(subject.total(order)).to eq 15
  end
end
