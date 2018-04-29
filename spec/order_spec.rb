require 'order'

describe Order do

  let(:order) { Order.new(menu, list) }
  let(:menu) { double :menu, items: { korma_police: 4.50 } }
  let(:list) { double :list }

  describe '#see_menu' do
    it 'displays a menu' do
      expect { order.see_menu }.to output.to_stdout
    end
  end

  describe '#add' do
    it 'raises an error if item not on menu' do
      expect { order.add(12, 1) }.to raise_error 'item not on menu'
    end
  end

  describe '#check_total' do
    it 'raises an error if total is not correct' do
      allow(list).to receive(:current_total)
      allow(list).to receive(:cost).and_return(5.5)
      expect { order.check_total(6.5) }.to raise_error "actual total of items is £#{'%.2f' % list.cost}"
    end

    it 'puts the total if value is correct' do
      allow(list).to receive(:current_total)
      allow(list).to receive(:cost).and_return(6.5)
      expect { order.check_total(6.5) }.to output.to_stdout
    end

  end
end
