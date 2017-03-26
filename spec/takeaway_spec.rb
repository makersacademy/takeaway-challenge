require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  describe "#read_menu" do
    it 'returns the list of items on the menu' do
      expect(takeaway.read_menu).to eq Menu.new.options
    end
  end

  it { is_expected.to respond_to(:add_food_to_order).with(2).arguments }


end
