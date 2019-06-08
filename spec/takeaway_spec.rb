require 'takeaway'

RSpec.describe Takeaway do
  let(:subject) { described_class.new }

  describe '#show_menu' do

    it 'return a list of dishes' do
      expect(subject.show_menu).to eq Takeaway::MENU
    end
  end
end