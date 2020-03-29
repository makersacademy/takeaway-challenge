require 'sms_interface'

describe SMSInterface do

  # Mocked order instance
  let(:order_inst) { double(:order) }

  # isolated SMS interface
  let(:isolated_sms_interface) { SMSInterface.new(order_inst) }

  describe '#treat' do
    it 'recieves an sms message "pie, 1, 6", and causes an order to be placed with those arguments' do
      expect(order_inst).to receive(:place).with('pie', 1, 6)
      isolated_sms_interface.treat('pie, 1, 6')
    end
    it 'recieves an sms message "pie, 1, mash, 1, 10", and causes an order to be placed with those arguments' do
      expect(order_inst).to receive(:place).with('pie', 1, 'mash', 1, 10)
      isolated_sms_interface.treat('pie, 1, mash, 1, 10')
    end
  end
end
