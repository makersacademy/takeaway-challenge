require 'order'

describe Order do

  let(:menu) { double :menu, items: { pappadom_preach: 0.50 }, total: 5.75 }
  let(:confirm) { double :confirm, send_text: 'Thank you!' }
  let(:order) { Order.new(menu, confirm) }

  it { is_expected.to respond_to(:view_order) }
  it { is_expected.to respond_to(:check_total) }

  describe '#see_menu' do
    it 'displays a menu' do
      expect { order.see_menu }.to output.to_stdout
    end
  end

  describe '#add' do
    it 'raises an error if item not on menu' do
      expect { order.add(12, 1) }.to raise_error 'item not on menu'
    end

    it 'prints the items selected' do
      allow(menu).to receive(:add_to_order)
      expect { order.add(1, 5) }.to output("you have added 5 pappadom_preach to your order\n").to_stdout
    end
  end

  describe '#complete_order' do
    it 'raises an error if not equal to order' do
      expect { order.complete_order(5.5) }.to raise_error 'total input is not equal to order'
    end

    it 'sends text if total is complete' do

      expect(order.complete_order(5.75)).to eq("Thank you!")
    end
  end
end
