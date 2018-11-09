require 'menu'

describe Menu do

  let(:fish) { instance_double('Dish', :name => 'Fish', :price => 2.50) }
  let(:chips) { instance_double('Dish', :name => 'Chips', :price => 1.20) }
  let(:subject) { Menu.new([fish, chips]) }

  context '#view' do
    it 'returns a list of dishes and their prices' do
      expect(subject.view).to eq [
        "#{fish.name}: £%.2f" % fish.price,
        "#{chips.name}: £%.2f" % chips.price
      ]
    end
  end
end
