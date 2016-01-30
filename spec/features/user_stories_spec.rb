require_relative '../../lib/takeaway.rb'
require 'twilio-ruby'

describe "FEATURE SPEC" do

  describe 'takeaway features' do

    it 'US1 - see a list of dishes with prices' do
      takeaway = Takeaway.new(Menu.new)
      expect(takeaway.show_menu).to eq ({ribs: 3,
        beef: 4,
        rolls: 3,
        chips: 2,
        pies: 5})
    end

    it 'US2 - selects some dishes' do
      takeaway = Takeaway.new(Menu.new)
      expect(takeaway.select({beef: 2, rolls: 3}, 17)).to eq ({beef: 2, rolls: 3})
    end

    it 'US3 - raises error when billed different amount' do
      takeaway = Takeaway.new(Menu.new)
      takeaway.select({beef: 2, rolls: 3}, 23) 
      expect {takeaway.correct_bill?}.to raise_error("incorrect bill amount")
    end

    it 'US4 - returns confirmation if bill matches estimate' do
      takeaway = Takeaway.new(Menu.new)
      confirmation = "Thank you! Your order was placed and will be delivered before #{(Time.now+ 60*60).strftime("%H:%M")}"
      allow(takeaway).to receive(:send_text).with(confirmation).and_return(confirmation)
      takeaway.select({beef: 2, rolls: 3}, 17) 
      expect(takeaway.correct_bill?).to eq confirmation
    end  
  end
end