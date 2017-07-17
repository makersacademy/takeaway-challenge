require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

    describe '#display_menu' do
      it 'displays the menu from the Menu class' do
        expect(takeaway.display_menu).to eq @menu
      end
    end

  describe '#order' do
    it 'returns error when item is not on the menu' do
      expect{takeaway.order("Hawaiian")}.to raise_error "That's not on the menu!"
    end
=begin
    it 'confirms single item added to basket' do
      expect(takeaway.order("Margherita")).to eq "1 Margherita added to basket."
    end

    it 'confirms multiple items added to basket' do
      expect(takeaway.order("Pollo", 3)).to eq "3 Pollos added to basket."
    end
=end
  end

  describe '#display_basket' do
    it 'indicates basket is empty on initialization' do
      expect{takeaway.display_basket}.to raise_error "Basket empty. Please order something."
    end

    it 'displays items in basket' do
      takeaway.order("Pollo", 3)
      expect(takeaway.display_basket).to eq ["Pollo", "Pollo", "Pollo"]
    end
  end

  describe '#display_total' do
    it 'shows the total price of the items in the basket' do
      takeaway.order("Pollo", 3)
      expect(takeaway.total).to eq 24
    end
  end

=begin
  describe '#checkout' do
    it 'instructs the takeaway to place the order, displays a confirmation message, calls send_text' do
      expect(takeaway.checkout).to
    end
  end

  describe 'send_text' do
    it 'sends text message to the customer to say the order will be delivered in one hour' do
    end
  end
=end
end
