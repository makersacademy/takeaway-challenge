require 'messager'

describe 'Messager' do

  subject(:messager) { Messager.new }

  describe '#send_sms' do
    it 'sends an sms' do
      expect(messager).to receive(:send_sms).with(@message)
      messager.send_sms(@message)
    end
  end
end
