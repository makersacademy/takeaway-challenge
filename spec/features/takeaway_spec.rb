describe 'TakeAway' do
  context 'when order is valid' do
    let(:sms_sender) { double :sms_sender }

    it 'sends an SMS message' do
      allow(sms_sender).to receive(:send_sms)

      new_order = ConfirmOrder.new(Menu.new, sms_sender)

      new_order.process_order({banana: 2, peach: 1}, 7.97)
      expect(sms_sender).to have_received(:send_sms)
    end
  end

  context 'when order is invalid' do
    it 'raises an exception for ordered item not on menu' do
      new_order = ConfirmOrder.new(Menu.new)
      error = 'Order not valid'
      expect{ new_order.process_order({banana: 2, pear: 1}, 7.97) }.to raise_error error
    end

    it 'raises an exception when expected total does not match actual total' do
      new_order = ConfirmOrder.new(Menu.new)
      error = 'Incorrect total'
      expect{ new_order.process_order({banana: 2, peach: 1}, 8.97) }.to raise_error error
    end
  end
end
