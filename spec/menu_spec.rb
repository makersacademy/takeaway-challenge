require 'menu'

describe Menu do
  subject(:menu) { described_class.new() }
  let(:pm) { double :pie_mash, name: 'Pie and mash', price: 8.99 }
  let(:ctm) { double :chiken_tikka_masala, name: 'Chicken Tikka Masala', price: 6.99 }

  describe '#new' do
    it 'menu should be empty in the start' do
      expect(menu.menu).to eq([])
    end
  end

  describe '#add' do
    it { is_expected.to respond_to(:add).with(1).arguments }
    it 'should add dish to @menu[]' do
      menu.add(pm)
      expect(menu.menu).to include(pm)
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
  end

  describe '#list_all' do
    it { is_expected.to respond_to(:list_all) }
    it 'should list all menu items' do
      menu.add(pm)
      menu.add(ctm)
      expect { menu.list_all }.to output("1: #{pm.name} -- #{pm.price}\n2: #{ctm.name} -- #{ctm.price}\n").to_stdout
    end
  end

end
