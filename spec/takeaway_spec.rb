require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:test_menu) { {'Pizza' => 7} }
  subject(:takeaway) { described_class.new (twilio_class)}
  let(:twilio_class) {double :twilio_class, :new => client }
  let(:client) {double :client}

  describe '#initialize' do
    it 'starts with an empty basket' do
      expect(takeaway.basket).to eq([])
    end
  end

  # USER STORY 1 (also tested in menu_spec)
  # As a customer
  # So that I can check if I want to order something
  # # I would like to see a list of dishes with prices
  describe '#show menu' do
    it 'returns contents of menu' do
      allow(takeaway).to receive(:show_menu) {test_menu}
      expect(takeaway.show_menu).to eq (test_menu)
    end
  end

  # USER STORY 2
  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  describe '#place order' do
    it 'allows user to order from the menu' do
      expect(takeaway).to respond_to(:place_order).with(2).argument
    end

    it 'updates the basket with the item and quantity' do
      takeaway.place_order('Funghi', 3)
      takeaway.place_order('Carne', 1)
      expect(takeaway.basket).to eq [['Funghi', 3], ['Carne', 1]]
    end
  end

  # USER STORY 3
  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches
  # the sum of the various dishes in my order
  describe '#caculate total' do
    it 'returns the breakdown of costs' do
      takeaway.place_order('Funghi', 3)
      takeaway.place_order('Carne', 1)
      expect(takeaway.calculate_total).to eq 25
    end
  end

  # USER STORY 4
  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was
  # placed and will be delivered before 18:52" after I have ordered
  describe '#send text' do
    it 'sends text when order total confirmed by user' do
      expect(client).to receive_message_chain("messages.create")
      takeaway.check_total
    end
  end


end
