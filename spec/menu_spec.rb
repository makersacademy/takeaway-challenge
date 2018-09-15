require 'menu'

describe Menu do
  
  describe '#initialize' do
    it 'is expected to be empty at creation' do
      expect(subject.items).to eq({}) 
    end
  end

  describe '#add' do
    it 'is expected to add item and price to the menu' do
      subject.add(:egg, 1)
      expect(subject.items).to eq({egg: 1})
    end
  end

  describe '#remove' do
    it 'is expected to remove item and price from the menu' do
      subject.add(:egg, 1)
      subject.remove(:egg)
      expect(subject.items).to eq({})
    end
  end

  describe '#print_menu' do
    it { is_expected.to respond_to(:print_menu) }

    it 'prints the menu for the user' do
      subject.add(:egg, 1)
      expect(subject.print_menu).to eq("Menu\nEgg £1")
    end

    it 'correctly formats the return with linebreaks' do
      subject.add(:egg, 1)
      subject.add(:toast, 2)
      expect(subject.print_menu).to eq("Menu\nEgg £1\nToast £2")
    end

  end

end