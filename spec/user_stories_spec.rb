require 'takeaway'

describe Takeaway do
  describe 'user stories' do
    subject(:takeaway) { described_class.new(menu, basket) }
    let(:menu) { double(:menu, show: shown_menu, includes_dish?: true) }
    let(:basket) { double(:basket, add: "ok") }
    let(:shown_menu) { "Masala Dosa - £7.95" }

    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'displays a list of dishes with their prices' do
      expect(takeaway.show_menu).to eq shown_menu
    end

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of
    # several available dishes
    it 'lets the user select a dish and an amount' do
      expect(takeaway.order('Masala Dosa', 2)).to eq("Added 2 x Masala Dosa to your order")
    end

    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been
    # given matches the sum of the various dishes in my order
    # it 'shows the user the sum of the various dishes in their order' do
    #   amount = 3
    #   takeaway.order(selection, amount)
    #   expect(takeaway.show_basket).to eq "#{amount} x #{selection} -- £#{amount * selection_price}"
    # end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order
    # was placed and will be delivered before 18:52" after I have ordered

    # guard conditions
  end
end
