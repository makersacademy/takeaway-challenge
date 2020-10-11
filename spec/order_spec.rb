require 'order'

describe Order do
  describe '#order' do
    it 'adds to total cost' do
      subject.order("fries", 2)
      expect(subject.total_cost).to eq 2.58
    end

    it 'adds order to basket' do
      subject.order("fries", 2)
      expect(subject.basket).to eq ["fries (2): £2.58"]
    end

    it 'raises an error if incorrect meal is provided' do
      expect{subject.order("amburger", 2)}.to raise_error(RuntimeError, "Oops! We don't stock that meal." )
    end
  end

  describe '#pay' do
    it 'raises an error if incorrent amount paid' do
      subject.order("fries", 2)
      expect{subject.pay(2.56)}.to raise_error(RuntimeError, "Incorrect amount specified" )
    end

    it 'when successful, basket is cleared' do
      subject.order("fries", 2)
      subject.pay(2.58)
      expect(subject.basket).to eq []
    end

    it 'when succesful, total cost is cleared' do
      subject.order("fries", 2)
      subject.pay(2.58)
      expect(subject.total_cost).to eq 0
    end

    it 'puts a confirmation message for a successful order' do
      subject.order("fries", 2)
      expect{subject.pay(2.58)}.to output("Order complete! Thank you for your purchase.\n").to_stdout
    end
  end
end
