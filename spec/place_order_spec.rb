require 'place_order'

describe PlaceOrder do

  describe "#takes_dishes" do
    it { is_expected.to respond_to(:ask_for_order) }
    it 'asks for an order' do
      expect(subject.ask_for_order).to eq "Please place your order in the form of order number, quantity. E.g. '23, 7'"
    end
    it { is_expected.to respond_to(:take_order) }
    it 'gets an order' do
      # TODO - find a way to check actual method here
      allow($stdin).to receive(:gets).and_return('foo')
      test_order = $stdin.gets
      expect(test_order).to eq('foo')
    end
    # edge cases to be dealt with - no input, impossible input, non integers, too many numbers, etc
  end

  describe "#checks total" do
    it { is_expected.to respond_to(:ask_for_total) } 
    it 'asks for an order' do
      expect(subject.ask_for_total).to eq 'Please write your expected order total below e.g 12.36'
    end
    it { is_expected.to respond_to(:take_total) } 
    it 'asks for an order' do
      # TODO - find a way to check actual method here
      allow($stdin).to receive(:gets).and_return('foo')
      test_total = $stdin.gets
      expect(test_total).to eq('foo')
    end
  # edge cases - no numbers, integers, no response
    it { is_expected.to respond_to(:check_total) }
    it 'checks a total against users total' do
      subject.total = 10
      subject.users_total = 10
      expect(subject.check_total).to eq "Your order has been placed. Please provide your phone number below."
    end
    it 'raises an error if totals do not match' do
      subject.total = 7
      expect { subject.check_total }.to raise_error('Total incorrect. Order failed')
    end
  end
  
  describe "gets number" do 
  end

end
