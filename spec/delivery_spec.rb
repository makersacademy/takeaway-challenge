require 'delivery'
RSpec.describe Delivery do

  subject(:delivery) { described_class.new }

  describe '#process_text' do
    before(:each) do
      allow(delivery).to receive(:process_text)
    end
    
    it 'it send a confirmation message' do
      subject.process_text
    end
  end
end
