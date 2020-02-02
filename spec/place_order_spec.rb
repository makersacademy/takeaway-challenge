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

  describe "#calculates expected total" do
    it { is_expected.to respond_to(:take_user_total) } 
      #TODO - test with stub total calc
    it 'calculates simple total' do
      subject.order = ["1", "1"]
      subject.calculate_total
      expect(subject.total).to eq 0.5
    end
    it 'calculates simple total' do
      subject.order = ["2", "1"]
      subject.calculate_total
      expect(subject.total).to eq 0.25
    end
    it 'calculates simple total with quantity' do
      subject.order = ["2", "2"]
      subject.calculate_total
      expect(subject.total).to eq 0.5
    end
    # it 'calculates total with two items' do
    #   subject.order = ["2", "2"],["1, 1"]
    #   subject.calculate_total
    #   expect(subject.total).to eq 1.0
    # end
  end

  describe "#checks total" do
    it { is_expected.to respond_to(:calculate_total) } 
    it { is_expected.to respond_to(:ask_for_total) } 
    it 'asks for total' do
      expect(subject.ask_for_total).to eq 'Please write your expected order total below e.g 12.36'
    end
    
    it 'takes user total' do
      # TODO - find a way to check actual method here
      allow($stdin).to receive(:gets).and_return(10)
      test_total = $stdin.gets
      expect(test_total).to eq(10)
    end
  # edge cases - no numbers, integers, no response
    it { is_expected.to respond_to(:total_agreed?) }
    it 'checks a total against users total' do
      subject.total = 10
      subject.users_total = 10
      expect(subject).to be_total_agreed
    end
    it { is_expected.to respond_to(:confirm_order) }
    it 'checks a total against users total' do
      subject.total = 10
      subject.users_total = 10
      subject.total_agreed?
      expect(subject.confirm_order).to eq "Your order has been placed. Please provide your phone number below."
    end
    it 'raises an error if totals do not match' do
      subject.total = 7
      expect { subject.confirm_order }.to raise_error('Total incorrect. Order failed')
    end
  end
  
  describe "#gets number" do 
    it { is_expected.to respond_to(:take_number) }
    it "obtains user number" do
      allow($stdin).to receive(:gets).and_return('01234567890')
      test_number = $stdin.gets
      expect(test_number).to eq('01234567890')
    end
  end

end
