require 'basket'

describe Basket do

  let(:menu) { double(:menu) }
  let(:dish) { double(:dish) }
  let(:price) { double(:price) }
  let(:subject) { described_class.new(menu) }

  describe '#add' do

    it 'adds dishes' do
      dish = "dish"
      expect { subject.add(dish, price, 1) }.to change { subject.basket }.from([]).to([{ :name => dish, :price => price, :quantity => 1 }])
    end

  end

  describe '#view' do

    it 'displays the total and basket' do
      subject.add("dish1", 2.01, 2)
      subject.add("dish2", 1.01, 1)
      expect(subject.view).to eq("Your basket total is 5.03 and it contains:\n2 x dish1 for 2.01 each\n1 x dish2 for 1.01 each")
    end

  end

end
