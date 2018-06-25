require 'takeaway'

describe Takeaway do
  describe 'user stories' do
    subject(:takeaway) { described_class.new() }

    let(:shown_menu) { "Dosa - £7.95, Chapatti - £2.70" }
    let(:basket_content) { "3 x Dosa - £23.85\n2 x Chapatti - £5.40" }

    before do
      takeaway.order('Dosa', 3)
      takeaway.order('Chapatti', 2)
    end

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
      expect(takeaway.order('Dosa', 2)).to eq("Added 2 x Dosa to your order")
    end

    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been
    # given matches the sum of the various dishes in my order
    it 'shows the user the sum of the various dishes in their order' do
      expect(takeaway.show_basket).to eq basket_content
    end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order
    # was placed and will be delivered before 18:52" after I have ordered
    it 'sends a text after the order is finalized' do
      expect { takeaway.checkout(29.25) }.not_to raise_error
    end
  end
end
