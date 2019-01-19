require 'takeaway'

RSpec.describe Takeaway do

  describe '#issue_menu' do

    it 'has a method to issue the menu' do
      expect(subject).to respond_to(:issue_menu)
    end
    # 
    # it 'a list of dishes with prices' do
    #   expect(subject.issue_menu).to be_a(Hash)
    # end

  end

end
