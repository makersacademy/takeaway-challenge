require 'dishes'
require 'stringio'

describe Dishes do

  it 'displays list of dishes with prices' do
    expect(subject.display).to eq ["Pepperoni Pizza - £5", "Bang Bang Chicken - £6", "Pasta - £4"]
  end

  describe '#choose' do

    it 'returns empty choice if none is chosen initially' do
      # allow(subject.meal).to receive('none')
      # allow(subject.quantity).to receive('0')
      # expect(subject.choose).to eq []
    end

    it 'adds choice to choices' do
      # allow(subject.meal).to receive('Pasta')
      # allow(subject.quantity).to receive('3')
      # allow(subject.meal).to receive('none')
      # allow(subject.quantity).to receive('0')
      # expect(subject.choose).to eq [{'Meal' => 'Pasta', 'Price' => 4, 'Quantity' => 3}]
    end

  end

end
