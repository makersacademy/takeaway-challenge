require 'menu'

describe Menu do

  let(:items) {{orange: 1, noodles: 10, pie: 6}}
  subject(:menu) {described_class.new}


  describe '#list_items' do
    it 'lists items currently on menu' do
      expect(menu.list_items).to eq ({})
    end
  end


  context 'managing menu items' do

    before do
      menu.add_items :orange, 2
    end

    describe '#add_item' do
      it 'adds an item to the list' do
        expect(menu.list_items).to include ({orange: 2})
      end
    end

    describe '#remove_item' do
      it 'removes an item from the list' do
        menu.add_items :pie, 8
        menu.remove_item :orange
        expect(menu.list_items).not_to include ({orange: 2})
      end
    end

  end

end
