require 'menu'

describe Menu do
    subject(:menu){described_class.new(order_class)}
    let(:order_class){double:order_class, new: order}
    let(:order){double:order, new_order: nil}
    let(:item){double:item}

  describe '#view_menu' do
    it 'returns menu' do
      expect(menu.view_menu).to eq menu.menu_view
    end
  end

  describe '#order' do
    it 'sends order to order class' do
      expect(order).to receive(:new_order).with(item)
      menu.order_item(item)
    end

    it 'creates new order' do
      expect(order_class).to receive(:new)
      menu.order_item(item)
    end
  end


end
