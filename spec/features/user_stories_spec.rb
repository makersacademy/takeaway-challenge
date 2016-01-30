require_relative '../../lib/takeaway.rb'
require_relative '../../lib/menu.rb'
require 'twilio-ruby'
require 'dotenv'

describe "FEATURE SPEC" do
  let(:takeaway) { Takeaway.new(Menu.new, Calculator.new) }
  let(:choice) { {beef:2, rolls:3} }
  let(:default_menu) { {ribs: 3,
        beef: 4,
        rolls: 3,
        chips: 2,
        pies: 5} }
  let(:confirm) {"Thank you! Your order was placed "\
                  "and will be delivered before "\
                 "#{(Time.now+ 60*60).strftime("%H:%M")}"}

  describe 'User Story 1' do
    it 'Can view a list of dishes with prices' do 
      expect(takeaway.show_menu).to eq default_menu
    end
  end

  describe 'User Story 2' do
    it 'You can select some dishes with quantities' do
      expect(takeaway.select(choice, 17)).to eq choice
    end
  end

  describe 'User Story 3' do
    it 'Raises error when billed different amount' do
      takeaway.select(choice, 23) 
      expect {takeaway.confirm_order}.to raise_error("incorrect bill amount")
    end

    it 'Calculates the bill correctly and returns no error' do
      allow(takeaway).to receive(:send_text).with(confirm).and_return(confirm)
      takeaway.select(choice, 17)
      expect {takeaway.confirm_order}.to_not raise_error
    end
  end

  describe 'User Story 4' do
    it 'Returns confirmation if bill matches estimate' do
      allow(takeaway).to receive(:send_text).with(confirm).and_return(confirm)
      takeaway.select(choice, 17) 
      expect(takeaway.confirm_order).to eq confirm
    end  
  end
end