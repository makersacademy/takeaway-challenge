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
      message = "Your Order:\n1. Mozzarela, $4\n2. Mushrooms, $6\n3. Ham, $5\nTotal: $15\n"
      expect { subject.view_order }.to output(message).to_stdout
    end
  end

  describe '#confirm_total' do
    it 'should not raise error if amount is correct' do
      expect { subject.confirm_total(1) }.to raise_error "Sum is not equal to total amount."
    end

    it 'should not raise error if amount is correct' do
      expect(subject.confirm_total(0)).to eq "Amount is correct."
    end
  end

end
