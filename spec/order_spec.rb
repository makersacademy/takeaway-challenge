require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:menu_options) {  }

  describe '#note_down' do
    it 'saves the current order in a hash' do
      menu_options = { pad_thai: 6.95 }
      allow(order).to receive(:gets).and_return('pad thai', '2', '')
      order.note_down(menu_options)
      expect(order.current).to eq( { pad_thai: 2 } )
    end
  end

  # allow(takeaway).to receive(:gets).and_return('pad thai', '2', '')
  # takeaway.take_order
  # expect(takeaway.order).to eq(['pad thai', 'pad thai'])


end
