require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new }

  describe '#see_menu' do
    it 'returns a formatted list of menu items to the customer' do
      expect { takeaway.see_menu }.to output("Cod & Chips - 5.40\nWhite Sausage - 2.30\n").to_stdout
    end
  end
end
