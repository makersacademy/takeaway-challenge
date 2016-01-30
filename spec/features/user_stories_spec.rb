require_relative '../../lib/takeaway.rb'
require_relative '../../lib/menu.rb'
require 'twilio-ruby'

describe "FEATURE SPEC" do
  let(:takeaway) { Takeaway.new(Menu.new) }
  let(:choice) { {beef:2, rolls:3} }
  let(:default_menu) { {ribs: 3,
        beef: 4,
        rolls: 3,
        chips: 2,
        pies: 5} }

  describe 'User Stories' do
    it 'Can view a list of dishes with prices' do 
      expect(takeaway.show_menu).to eq default_menu
    end

    it 'You can select some dishes with quantities' do
      expect(takeaway.select(choice, 17)).to eq choice
    end

    it 'Raises error when billed different amount' do
      takeaway.select(choice, 23) 
      expect {takeaway.confirm_order}.to raise_error("incorrect bill amount")
    end

    it 'Returns confirmation if bill matches estimate' do
      confirm = "Thank you! Your order was placed "\
                     "and will be delivered before "\
                     "#{(Time.now+ 60*60).strftime("%H:%M")}"
      allow(takeaway).to receive(:send_text).with(confirm).and_return(confirm)
      takeaway.select(choice, 17) 
      expect(takeaway.confirm_order).to eq confirm
    end  
  end
end