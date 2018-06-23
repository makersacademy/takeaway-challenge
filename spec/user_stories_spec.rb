require 'takeaway'

describe Takeaway do
  describe 'user stories' do
    subject(:takeaway) { described_class.new }
    let(:menu) { described_class::MENU }

    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it 'displays a list of dishes with prices' do
      expect(takeaway.show_menu).to eq menu
    end

    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of
    # several available dishes
    it 'lets user select a dish and amount' do
      selection = menu.first[:dish]
      expect(takeaway.order(selection, 2)).to eq("2 x #{selection}")
    end
  end
end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been
  # given matches the sum of the various dishes in my order
  #
  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order
  # was placed and will be delivered before 18:52" after I have ordered
