require 'takeaway'

describe Takeaway do

    describe '#display_menu' do
      it 'displays the menu from the Menu class' do

      end
    end

  describe '#order' do
    it 'orders item from the menu' do
      expect(subject.order("Margherita")).to eq
    end
  end

  describe '#display_basket' do
    it 'shows the items in the basket' do

    end
  end

  describe '#display_total' do
    it 'shows the total price of the items in the basket' do

    end
  end

  describe '#checkout' do
    it 'instructs the takeaway to place the order, displays a confirmation message, calls send_text' do

    end
  end

  describe 'send_text' do
    it 'sends text message to the customer to say the order will be delivered in one hour' do

    end
  end
end
