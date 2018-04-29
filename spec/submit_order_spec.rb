require 'submit_order'

describe SubmitOrder do
  let(:subject) { SubmitOrder.new(SendMessage, true) }
  context '#submit' do
    it 'Sends when order valid' do
      order = { 'Dish one' => [4.5, 2] }
      expect(subject.submit(order)).to eq "Order submitted"
    end
    it "Doesn't send when the order is empty" do
      order = {}
      expect { subject.submit(order) }.to raise_error(RuntimeError)
    end
  end
end
