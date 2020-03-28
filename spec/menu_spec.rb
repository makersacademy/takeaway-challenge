require 'menu'

describe Menu do

  # Dish class doubles
  let(:pie_class) { double(:Pie, new: pie_inst)}
  let(:mash_class) { double(:Mash, new: mash_inst)}
  let(:chips_class) { double(:Chips, new: chips_inst)}

  # Dish instance doubles
  let(:pie_inst) { double(:pie, name: "Pie", price: 6, details: "Pie (£6)") }
  let(:mash_inst) { double(:mash, name: "Mash", price: 4, details: "Mash (£4)") }
  let(:chips_inst) { double(:chips, name: "Chips", price: 5, details: "Chips (£5)") }
  
  # Menu items with mock dish hashes injected
  let(:menu_1) { Menu.new({1 => pie_class}) }
  let(:menu_2) { Menu.new({1 => pie_class, 2 => mash_class}) }
  let(:menu_3) { Menu.new({1 => pie_class, 2 => mash_class, 3 => chips_class}) }
  
  describe '#view' do
    it 'by default should display a list of dishes with prices' do
      expect(subject.view).to eq "1. Pie (£6)\n2. Mash (£4)\n3. Chips (£5)"
    end
    it 'should display only 1 item if there is only 1 item on the menu' do
      expect(menu_1.view).to eq "1. Pie (£6)"
    end
    it 'should display only 2 items if there is only 2 items on the menu' do
      expect(menu_2.view).to eq "1. Pie (£6)\n2. Mash (£4)"
    end
    it 'should display 3 items if there is only 3 items on the menu' do
      expect(menu_3.view).to eq "1. Pie (£6)\n2. Mash (£4)\n3. Chips (£5)"
    end
  end

  describe '#provide_dish' do
    it 'returns a Pie object when passed 1' do
      expect(subject.provide_dish(1)).to be_kind_of(Pie)
    end
    it 'returns a Mash object when passed 2' do
      expect(subject.provide_dish(2)).to be_kind_of(Mash)
    end
    it 'returns a Chips object when passed 3' do
      expect(subject.provide_dish(3)).to be_kind_of(Chips)
    end
    it 'raises error when passed a something outside of the menu' do
      expect { subject.provide_dish("pie please") }.to raise_error "That number isn't an item on the menu"
    end
  end
end