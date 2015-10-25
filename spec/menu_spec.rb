require 'menu'

describe Menu do
  let(:chinese_menu) { [{food: "Salt and Pepper King Prawn", price: 3.99, quantity_ordered: 0}, {food: "Pork Dumplings", price: 2.50, quantity_ordered: 0}]}
  let(:british_menu) { [{food: "Fish and Chips", price: 4.50, quantity_ordered: 0}, {food: "Battered Sausage", price: 2.29, quantity_ordered: 0}] }
  let(:british_menu_klass) { described_class.new(british_menu) }
  subject { described_class.new(chinese_menu) }

  describe '#initialize' do
    it 'should allow you to specify menu on creation' do
      expect(british_menu_klass.menu).to eq british_menu
    end
  end

  describe '#add' do
    it 'allows you to add some food' do
      expect{ subject.add("Salt and Pepper King Prawn", 2) }.to change{ subject.menu[0][:quantity_ordered] }.from(0).to(2)
    end
    it 'defaults to one item being added if no second argument is provided' do
      expect{ subject.add("Salt and Pepper King Prawn") }.to change{ subject.menu[0][:quantity_ordered]}.from(0).to(1)
    end
    it 'raises an error when the food does not exist' do
      expect{ subject.add("A LOAD OF RUBBISH") }.to raise_error "Food type not found for A LOAD OF RUBBISH"
    end
  end

  describe '#total' do
    it 'adding items calling total amends the total' do
      subject.add("Pork Dumplings", 3 )
      subject.add("Salt and Pepper King Prawn", 3)
      expect(subject.total).to eq 19.47
    end
  end

  describe '#view_basket' do
    it 'should display the current basket in text format' do
      subject.add("Pork Dumplings", 2 )
      subject.add("Salt and Pepper King Prawn", 4)
      expect(subject.view_basket).to eq "Salt and Pepper King Prawn x4: £15.96, Pork Dumplings x2: £5.00, Total: £20.96"
    end
    it 'should display the current basket in text format when one item is ordered' do
      subject.add("Salt and Pepper King Prawn", 4)
      expect(subject.view_basket).to eq "Salt and Pepper King Prawn x4: £15.96, Total: £15.96"
    end
    it 'should raise an error if there is nothing in the basket' do
      expect{subject.view_basket}.to raise_error "Nothing added to the order!"
    end
  end

  describe '#view_menu' do
    it 'should display the menu' do
      expect(STDOUT).to receive(:puts).with("Salt and Pepper King Prawn - £3.99")
      expect(STDOUT).to receive(:puts).with("Pork Dumplings - £2.50")
      subject.view_menu
    end
  end
end