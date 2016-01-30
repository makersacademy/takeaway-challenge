require 'takeaway'

RSpec.describe Takeaway do

  subject(:takeaway)  {described_class.new}

    it 'see a list of dishes with prices' do
      expect(takeaway.display_menu).to eq ('{"chicken"=>3, "rice"=>1, "pizza"=>6, "chips"=>2}')
    end


end
