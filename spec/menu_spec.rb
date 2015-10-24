require 'menu'

describe Menu do
  subject {described_class.new}
  describe '#initialize' do
    it 'is assigned a menu' do
      expect(subject.menu).to eq Menu::DEFAULT_MENU
    end
  end

  describe '#add' do
    it 'allows you to add some food' do
      expect{ subject.add("Salt and Pepper King Prawn") }.to change{ subject.menu[0][:quantity_ordered] }.by 1
    end
  end

  describe '#total' do
    it 'calculates the total' do
      subject.add("Pork Dumplings", 3 )
      subject.add("Salt and Pepper King Prawn", 3)
      expect(subject.total).to eq "£23.46"
    end
  end

  describe '#view_menu' do
    it 'should display the menu' do
      stub_const("Menu::DEFAULT_MENU", [{food: "Pork Dumplings", price: 2.50, quantity_ordered: 0}])
      expect(STDOUT).to receive(:puts).with("Pork Dumplings - £2.50")
      subject.view_menu
    end
  end
end