require 'take_away'

describe TakeAway do
    subject(:takeAway) { described_class.new }

    it "Shows the menu with list of dishes and prices" do
        expect(takeAway.menu).to eq('Sausage: £5')
    end
end
