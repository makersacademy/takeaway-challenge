require 'order'

RSpec.describe Order do
  let(:subject) { described_class.new }

  describe '#start_order' do
    before(:each) { $stdin = StringIO.new }

    it 'return a list of dishes from the user input' do
      allow($stdin).to receive(:gets).and_return("olives", "1", "close")
      expect(subject.start_order).to eq({ :olives => 1 }) 
    end 
  end

  describe '#total' do

    it 'returns the total' do
      expect(subject.total).to eq(0)
    end
  end
end
