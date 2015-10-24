require 'takeaway'

describe Takeaway do

  let(:takeaway) {described_class.new}

  describe 'viewing the list of dishes' do
    it 'displays the list of dishes' do
      takeaway.menu
      expect(takeaway.instance_variable_get(:@menu_file)).to have_received(:read)
    end
  end

end
