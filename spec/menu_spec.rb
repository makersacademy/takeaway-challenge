require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish, name: 'Steak', price: 25 }
  let(:dish2) { double :dish, name: 'Chips', price: 8 }
  let(:dish3) { double :dish, name: 'Caesar Salad', price: 9 }

  describe '#initialize' do
    it 'is created with an empty array' do
      expect(menu.list).to be_instance_of(Array)
    end
  end

  describe '#add' do
    it 'adds dishes to the list of dishes' do
      menu.add(dish)
      expect(menu.list).to include(dish)
    end
  end

  describe '#display' do
    let(:pretty_print) { "1.) Steak - £25\n2.) Chips - £8\n3.) Caesar Salad - £9\n" }
    it 'pretty prints a list of dishes and prices' do
      menu.add(dish)
      menu.add(dish2)
      menu.add(dish3)
      expect { menu.display }.to output(pretty_print).to_stdout
    end
  end
end
