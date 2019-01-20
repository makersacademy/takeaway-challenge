require 'takeaway'

RSpec.describe Takeaway do

  describe '#issue_menu' do

    it 'has a method to issue the menu' do
      expect(subject).to respond_to(:issue_menu)
    end

  end

end
