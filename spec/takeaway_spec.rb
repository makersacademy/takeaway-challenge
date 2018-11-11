require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new }

  describe '#view_menu' do

    it { is_expected.to respond_to :view_menu }

    it 'has a list of dishes with prices' do
      expect(takeaway.view_menu).not_to be_empty
    end
  end
end
