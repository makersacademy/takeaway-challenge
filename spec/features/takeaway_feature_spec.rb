require 'takeaway'
require 'menu'

describe Takeaway do


  subject(:takeaway) { described_class.new(menu: @menu, twilio: @messenger) }

  before(:each) do
    @messenger = double('messenger')
    @list = { coconut_rice: 2, lassee: 1.5, plain_naan: 2, jalfrezi: 4 }
    @menu = Menu.new(@list)
  end

  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices

  context 'customers should be able to view the menu' do

    it 'should show customers a menu' do
      expect(subject.menu).to eq(@list)
    end
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it 'should allow customers to select dishes' do
    takeaway.order('coconut_rice')
    takeaway.order('coconut_rice')
    takeaway.order('lassee')
    takeaway.order('lassee', 3)
    expect(takeaway.print_basket).to eq("coconut_rice x 2 (£4.00), lassee x 4 (£6.00)\nThe total is £10.00")
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  it "the order should be placed if the customer confirms the total" do

    allow(Time).to receive(:now).and_return(Time.new(2019, 01, 19, 17, 52))
    takeaway.order('coconut_rice')
    takeaway.order('lassee')
    takeaway.order('plain_naan')
    takeaway.order('jalfrezi')
    allow(@messenger).to receive(:create_message)
    expect(takeaway.checkout(9.5)).to eq('Thank you! Your order was placed and will be delivered before 18:52')
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  it 'should send a text message if the customer confirms the total' do
    allow(Time).to receive(:now).and_return(Time.new(2019, 01, 19, 17, 52))
    takeaway.order('coconut_rice')
    takeaway.order('lassee')
    takeaway.order('plain_naan')
    takeaway.order('jalfrezi')
    message = 'Thank you! Your order was placed and will be delivered before 18:52'
    expect(@messenger).to receive(:create_message).with(message)
    takeaway.checkout(9.5)
  end

end
