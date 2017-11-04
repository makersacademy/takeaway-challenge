require 'takeaway'
describe TakeAway do
  let(:take_away) { described_class.new }
  let(:menu) { double 'fake menu', read_menu: [{ "Chocolate Melt" => 7.99 }, { "Apple Crumble" => 6.99 }, { "Banana Split" => 6.99 }] }

  context 'when new instance of takeaway is made' do
    it 'should instantiate with an empty basket' do
      expect(take_away.basket).to eq []
    end
    it 'should instantiate with a menu' do
      expect(take_away.menu).to be_an_instance_of Menu
    end
  end
  describe '#read_menu' do
    it 'should print the items on the menu' do
      expect(take_away.read_menu).to eq menu.read_menu
    end
  end
  describe '#add_to_basket' do
    it 'should add an item to the basket' do
      take_away.add_to_basket('Chocolate Melt')
      expect(take_away.basket).to contain_exactly({ 'Chocolate Melt' => 7.99 })
    end
    it 'should add any item to the basket' do
      take_away.add_to_basket('Apple Crumble')
      expect(take_away.basket).to contain_exactly({ 'Apple Crumble' => 6.99 })
    end
    it 'should raise error if trying to order unknown menu item' do
      expect { take_away.add_to_basket("Cheese") }.to raise_error 'Unknown item'
    end
  end
  describe '#see_basket' do
    it 'should show me the items of the basket and the total' do
      take_away.add_to_basket('Chocolate Melt')
      expect(take_away.see_basket).to eq 'total: £7.99'
    end
    it 'should show me the items of the basket and the total' do
      take_away.add_to_basket('Chocolate Melt')
      take_away.add_to_basket('Apple Crumble')
      expect(take_away.see_basket).to eq 'total: £14.98'
    end
  end
  describe '#remove_from_basket' do
    it 'should remove any item from basket' do
      take_away.add_to_basket('Apple Crumble')
      take_away.add_to_basket('Chocolate Melt')
      take_away.remove_from_basket('Chocolate Melt')
      expect(take_away.basket.include?({'Chocolate Melt'=> 7.99})).to be_falsey
    end
  end
end
