require 'FinishMyOrder'

# test peer classes and terminal io here

describe FinishMyOrder do
  context 'when initialising' do
    it 'creates an instance of FinishMyOrder' do
      fake_order = double(:order, order: [['burger', 4.5], ['chips', 2.0]])
      finish_my_order = FinishMyOrder.new(fake_order)
      expect(finish_my_order).to be_an_instance_of(FinishMyOrder)
    end

    it 'fails if the order is empty' do 
      fake_order = double(:order, order: [])
      expect{ FinishMyOrder.new(fake_order) }.to raise_error('Order empty')
    end
  end

  describe '#receipt' do
    it 'prints the receipt for the order' do
      fake_order = double(:order, order: [['burger', 13.5, 3], ['chips', 2.0, 1]])
      terminal = double(:terminal)
      expect(terminal).to receive(:puts).with('What you ordered:')
      expect(terminal).to receive(:puts).with('3x burger - £13.50')
      expect(terminal).to receive(:puts).with('1x chips - £2.00')
      expect(terminal).to receive(:puts).with('Grand Total: £15.50')
      finish_my_order = FinishMyOrder.new(fake_order, terminal)
      finish_my_order.receipt
    end
  end

  describe '#send_text' do
    # it 'sends a confirmation text to the user that order will arrive in 20 minutes from now' do
    # sends text, not quite sure how to test this yet
    # end
  end
end
