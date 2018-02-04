require 'order'

describe Order do

  subject(:order) { described_class.new }
  menu_options = { pad_thai: 6.95 }

  before(:each) do
    allow(order).to receive(:gets).and_return('pad thai', '2', '')
    order.note_down(menu_options)
  end

  describe '#note_down' do
    it 'saves the item order and its quantity in a hash' do
      expect(order.current).to eq( { pad_thai: 2 } )
    end
  end

  describe '#print_verification' do
    it 'prints the total order and the total price' do
      order_verification = "You ordered:\n2 x pad thai(s) - £6.95 each\nTotal cost: £13.9\n"
      expect { order.print_verification(menu_options) } .to output(order_verification).to_stdout
    end
  end

end
