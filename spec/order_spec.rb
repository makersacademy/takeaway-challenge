require 'order'

describe Order do

  describe '#new' do
    it 'makes a blank array for the customer order' do
      expect(subject.customer_order).to be_an_instance_of(Array)
    end
  end

  describe '#show_current_order' do
    it 'to print a blank array of the customer order' do
      expect(subject.customer_order).to be_an_instance_of(Array)
    end
  end

  describe '#add' do
    it 'adds the given dish to the order array a given number of times' do
      subject.add_to_order("Rice", 4)
      expect(subject.customer_order).not_to be nil
    end
  end
end
