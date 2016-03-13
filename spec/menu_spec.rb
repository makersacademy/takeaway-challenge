require 'menu'

describe Menu do
    subject(:menu){described_class.new(order_class,delivery_message)}
    let(:order_class){double:order_class, new: order}
    let(:order){double:order, new_order: value, order_review: nil, completed: nil}
    let(:item){double:item}
    let(:delivery_message){double:delivery_message, new: message}
    let(:message){double:message, send_message: nil}
    let(:value){double:value}

  describe '#view_menu' do
    it 'returns menu' do
      expect(menu.view_menu).to eq menu.menu_view
    end
  end

  describe '#order_item' do
    it 'sends order to order class' do
      expect(order).to receive(:new_order).and_return(item)
      menu.order_item(item)
    end

    it 'creates new order' do
      expect(order_class).to receive(:new)
      menu.order_item(item)
    end

  end

  describe '#review' do
    it 'raise error if there is no order to review' do
      message = 'You must order first'
      expect{menu.review}.to raise_error message
    end
  end

  describe '#finish_order' do
    it 'It completes order' do
      menu.order_item(item)
      expect(order).to receive(:completed)
      menu.finish_order
    end

    it 'raises error if no order made yet' do
      message = "You must order first"
      expect {menu.finish_order}.to raise_error message
    end

    it 'calls for text to be sent' do
      menu.order_item(item)
      expect(message).to receive(:send_message)
      menu.finish_order
    end

  end



end
