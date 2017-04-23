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

  describe '#confirm_total' do
    it 'should raise error if amount is incorrect' do
      expect { subject.confirm_total(1) }.to raise_error "Sum is not equal to total amount."
    end

    it 'should not raise error if amount is correct' do
      expect(subject.confirm_total(0)).to eq "Amount is correct."
    end
  end

end
