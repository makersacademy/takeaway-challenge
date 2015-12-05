require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  context '#menu' do

    it  { is_expected.to respond_to :menu}

    it 'returns the menu in a hash when called' do
      expect(takeaway.menu).to eq ({
        :salad => 12,
        :burger => 14,
        :fajitas => 13,
        :pasta => 8,
        :brownies => 9
      })
    end
  end

end
