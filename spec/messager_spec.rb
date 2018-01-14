require 'messager'

describe Messager do
  subject(:messager) { described_class.new }

  describe '#confirm_order_by_text' do
    it 'should be able to try to send a text message' do
      expect(messager).to respond_to(:confirm_order_by_text)
    end
  end
end
