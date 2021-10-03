require 'menu'

describe Menu do
  
  describe '#initialise' do
    it 'should create an empty hash to store menu items in' do
      expect(subject.menu_items.is_a? Hash).to eq true
    end
  end

  describe '#add_item' do
    it 'should add a dish to the items hash' do
      expect { subject.add_item('Steak', 18.50) }.to change { subject.menu_items.length }.by(1)
    end
  end

  describe '#list_dishes' do
    it 'should show a list of dishes' do
      subject.add_item('Steak', 18.50)
      subject.add_item('Vegan Steak', 18.50)
      expect(subject.list_dishes).to eq("Vegan Steak" => 18.5, "Steak" => 18.5,) 
    end
  end

  describe '#dish_available' do
    it 'should return true if dish is on the menu' do
      subject.add_item('Steak', 18.50)
      expect(subject.dish_available?('Steak')).to eq true
    end

    it 'should return false if dish is on the menu' do
      subject.add_item('Steak', 18.50)
      expect(subject.dish_available?('Stake')).to eq false
    end
  end

end
