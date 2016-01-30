require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe '#basket' do
    it 'starts with an empty basket' do
      expect(takeaway.basket).to be_empty
    end
  end

  # describe '#show_menu' do
  #
  # end
  #
  # describe '#order' do
  #
  # end
  #
  # describe '#checkout' do
  #
  # end
end
