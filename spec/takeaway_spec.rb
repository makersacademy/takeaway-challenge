require 'takeaway'

RSpec.describe Takeaway do

  describe '#issue_menu' do

    it 'has a method to issue the menu' do
      expect(subject).to respond_to(:issue_menu)
    end

    it 'have a list of dishes with prices' do
      expect(subject.issue_menu).to be_a(Hash)
    end

    # it 'can print the menu' do
    #   expect(subject.issue_menu).to eq(
    #     "1. pizza - £5.50
    #      2. fish - £7.50
    #      3. chips - £2.00
    #      4. kebab - £5.00
    #      5. curry - £7.50"
    #   )
    # end

  end

end
