require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to(:menu)  }

  describe '#print_menu' do
    it 'Shows customer the menu' do
      expect(subject.print_menu).to eq("Pepperoni: £8.00")
    end
  end

end
