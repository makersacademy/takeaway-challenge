require 'menu'

describe Menu do 
  subject(:menu) { Menu.new }
  let(:pie) { instance_double Dish, name: 'pie', price: 3 }
  let(:mash) { instance_double Dish, name: 'mash', price: 2 }
  let(:peas) { instance_double Dish, name: 'peas', price: 1 }
  let(:mockMenu) { described_class.new([pie, mash, peas])}

  describe '#initialize' do 
    it 'defaults with no dishes' do 
      expect(subject.dishes).to be_empty
    end

    it 'allows dishes to be added' do 
      expect(mockMenu.dishes).to eq [pie, mash, peas]
    end
  end

end