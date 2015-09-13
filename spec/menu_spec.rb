require 'menu.rb'

describe Menu do

  subject {Menu.new({ pizza: 5.99, burger: 4.99})}

  describe '#list' do
    it 'Should respond to menu'do
      is_expected.to respond_to(:list)
    end
    it 'should list out the menu items' do
      expect(subject.list).to eq("pizza: £5.99, burger: £4.99")
    end
  end
  describe '#add' do
    it 'should add items to menu' do
    subject.add(:chip, 3.99)
    expect(subject.items).to eq({pizza: 5.99, burger: 4.99, chip: 3.99})
    end
  end
  describe '#remove'
    it 'should remove items from the menu' do
      subject.remove(:burger)
      expect(subject.items).to eq({pizza: 5.99})
    end
end
