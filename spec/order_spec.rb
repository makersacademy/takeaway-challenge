require 'order'

describe Order do

  describe '#add_to_order' do
    it 'should allow user to select a dish' do
      expect(subject.add_to_order(1)).to eq "Mozzarela pizza added."
    end
  end

  describe '#my_order' do
    it 'prints the trolley and total price' do
      subject.add_to_order(1)
      subject.add_to_order(2)
      subject.add_to_order(3)
      expect(subject.total_price).to eq 15
    end
  end

  describe '#view_order' do
    it 'should print order' do
      subject.add_to_order(1)
      subject.add_to_order(2)
      subject.add_to_order(3)
      message = "Your Order:\nMozzarela, $4...............x1\nMushrooms, $6...............x1\nHam, $5.....................x1\n                    Total: $15\n"
      expect { subject.view_order }.to output(message).to_stdout
    end
  end

  describe '#checkout' do
    it 'should raise error if amount is incorrect' do
      expect { subject.checkout(1) }.to raise_error "Sum is not equal to total amount."
    end

    it 'should not raise error if amount is correct' do
      message = "Thank you! Your order was placed and will be delivered before #{Hour.new.eta_to_string}"
      allow_any_instance_of(Sms).to receive(:send_message).and_return(message)
      subject.add_to_order(1)
      expect(subject.checkout(4)).to eq "Order confirmed. Check your phone for delivery details."
    end
  end

  describe '#place_order' do
    it 'should raise error if trolley is empty' do
      expect { subject.place_order }.to raise_error "Your order is empty."
    end
  end

end
