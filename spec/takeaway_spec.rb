require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  let(:menu_class) { double :menu_class }

  describe '#initialize' do

    it 'checks for an initialized empty hash' do
      expect(takeaway.chosen_items).to be_empty
    end
  end
end
