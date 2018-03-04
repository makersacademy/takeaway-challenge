require 'menu'

describe Menu do
  subject(:menu) { described_class.new() }
  let(:pm) { double :pie_mash, name: 'Pie and mash', price: 8.99 }
  let(:ctm) { double :chiken_tikka_masala, name: 'Chicken Tikka Masala', price: 6.99 }

  describe '#new' do
    it 'menu should be empty at start' do
      expect(menu.menu).to eq([])
    end
  end

  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).arguments }
    it 'should add dish to @menu[]' do
      menu.add(pm)
      expect(menu.menu).to include(pm)
    end

    it 'should raise error if dish already exits in menu' do
      menu.add(pm)
      expect{ menu.add(pm) }.to raise_error 'Menu item already exists'
    end

  end

  describe '#remove' do
    it { is_expected.to respond_to(:remove).with(1).arguments }
    it 'should remove menu item from the menu' do
      menu.add(pm)
      menu.add(ctm)
      menu.remove(pm)
      expect(menu.menu).not_to include(pm)
    end
    it 'should raise error if dish is not in the menu' do
      expect { menu.remove(pm) }.to raise_error 'Dish not found in the menu'
    end
  end

  describe '#list_all' do
    it { is_expected.to respond_to(:list_all) }
    it 'should list all menu items' do
      menu_print = "\n" + "=" * 50 + "\n" + "Bla Bla Kitchen Menu".center(40) +
      "\n" + "=" * 50 + "\n" +
      "No.".ljust(5) + "Dish".center(30) + "Price".rjust(15) + "\n" + "-" * 50 + "\n" +
      "1.".ljust(5) + "#{pm.name}".center(30) + "#{pm.price}".rjust(15) + "\n" +
      "2.".ljust(5) + "#{ctm.name}".center(30) + "#{ctm.price}".rjust(15) + "\n" +
      "=" * 50 + "\n"

      menu.add(pm)
      menu.add(ctm)
      expect { menu.list_all }.to output(menu_print).to_stdout
    end
  end

end
