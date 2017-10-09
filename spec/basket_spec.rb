require 'basket'

describe Basket do
  let(:dishes) { double(:dishes) }

  it 'allows you to select a meal' do
    expect(subject.select_meal({chicken_bhuna: 2, pilau_rice: 1})).to eq({
      chicken_bhuna: 2,
      pilau_rice: 1})
  end
end
