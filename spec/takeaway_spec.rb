require 'takeaway'

describe Takeaway do

  subject("takeaway") { described_class.new }
  numbers = [1]
  describe '#menu' do

    it 'tells the menu to print' do
      expect { takeaway.menu }.to output("1: Burger, £5.50\n2: Pizza, £5.00\n").to_stdout
    end
  end

  describe '#new_order' do

    it 'creates a new order' do
      takeaway.new_order(numbers)
      expect(takeaway.order).not_to be_nil
    end
  end

end
