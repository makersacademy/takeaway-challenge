require 'menu'
describe Menu do
subject(:menu){ described_class.new(dishes) }
  let(:dishes) { {donner: 1.99, chicken_tikka: 2.99 } }


    it 'validates the dish name with price' do
      expect(menu.dishes).to eq([dishes])
    end

    it 'display the list of dishes' do
      expect(menu.display_menu).to eq [dishes]
    end

end # => menu describe
