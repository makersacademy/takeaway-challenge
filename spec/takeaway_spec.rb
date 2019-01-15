require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  context 'customers should be able to view the menu' do

    it '#menu' do
      menu = ""
      expect(subject.menu).to eq(menu)
    end



  end

end