require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu)}
  let(:menu) {double(:menu, :menu_list => {"chicken" => 15.50}) }

  describe '#list_menu' do

    it 'lists the current available menu items' do
      expect(takeaway.list_menu).to eq({"chicken" => 15.50})
    end
  end


end