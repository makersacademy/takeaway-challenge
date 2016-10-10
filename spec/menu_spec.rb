require 'menu'

describe Menu do

  let(:menu_check) {described_class.new}

  describe '#initialize' do
   it 'will have a basic list of dishes as standard' do
    expect(subject.menu).to include(name: 'Rice', price: 1.50)
   end
  end

  describe '#add_dish' do
   it 'will allow the user to add a dish to the menu' do
     subject.add_dish('curry', 10)
     expect(subject.menu).to include(name: 'curry', price: 10.00)
   end
  end

  describe '#remove_dish' do
    it 'allows the user to remove a dish from the menu' do
      subject.remove_dish('Rice')
      expect(subject.menu).not_to include(name: 'Rice', price: 1.50)
    end
  end

  describe '#show_menu' do
    it 'shows the menu' do
      expect(subject.show_menu).to eq subject.menu
    end

    it 'only shows a copy of the menu that cant be altered' do
      subject.show_menu.delete('Rice')
      expect(subject.menu).to eq menu_check.menu
    end
  end
end
