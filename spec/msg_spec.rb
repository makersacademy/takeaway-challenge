require 'msg'

describe Msg do
  subject(:msg) { described_class.new }

  describe '#expected_time' do
    it 'gives a delivery time of 1 hour from the current time' do
      expect(msg.expected_time).to eq ((Time.new + 3600).hour.to_s + ":" + (Time.new + 3600).min.to_s)
    end
  end

  describe '#send_confirmation' do
    it 'sends a text if the order is successful' do
      expect(msg).to receive(:send_confirmation).and_return("Your order was successful and should arrive by #{(Time.new + 3600).hour.to_s + ":" + (Time.new + 3600).min.to_s}.")
      msg.send_confirmation
    end
  end
end
