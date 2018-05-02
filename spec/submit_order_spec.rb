require 'submit_order'

describe SubmitOrder do
  let(:subject) { described_class.new(client) }
  let(:client) { double(:client) }
  let(:messenger) { double(:messenger) }

  before do
    allow(client).to receive(:new).and_return(client)
    allow(client).to receive(:send).and_return(client)
  end

  context '#submit' do
    it 'Sends when order valid' do
      allow(client).to receive(:valid_order?)
      order = { 'Dish one' => [4.5, 2] }
      
      expect(subject.submit(order)).to eq client
    end
    it "Doesn't send when the order is empty" do
      allow(client).to receive(:valid_order?).and_return(false)
      order = {}

      expect { subject.submit(order) }.to raise_error(RuntimeError)
    end
  end
end
