require 'menu'
require 'csv'

  describe Restaurant do
    subject(:restaurant) {described_class.new}
    let(:takeaway_menu) 
    let(:menu_displayed) {double :menu_displayed}

    describe '#display' do
      it { is_expected.to respond_to :display}

      it 'shows the menu with the dishes and prices' do
        expect(restaurant.menu).to eq takeaway_menu
      end
    end

    #able to order some number of dishes

    #knows the order total

    #sends a text message when the order has been placed
end
