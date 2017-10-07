require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  describe '#initialize' do

    it 'shows me the menu' do
      expect(takeaway).to respond_to :menu
    end

  end


end