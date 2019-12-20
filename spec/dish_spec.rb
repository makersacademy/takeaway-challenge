require 'Dish'

describe Dish do
  describe '#price' do
    it 'shows the price of a dish'do
    expect(subject.price(3)).to eq 3
    end
  end
end
