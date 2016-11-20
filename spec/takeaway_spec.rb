require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(menu, order) }
  let(:klass1) { double(:klass1) }
  let(:klass2) { double(:klass2) }
  let(:menu) { double(:menu) }
  let(:order) { double(:order) }
  let(:item) { double(:item) }
  let(:qty) { double(:qty) }

  before do
    allow(menu).to receive(:new).and_return menu
    allow(order).to receive(:new).and_return order
    allow(menu).to receive(:menu_list).and_return ({"Spag_Bol" => 6.5, "Pizza" => 4, "Chips" => 2.75})
    allow(order).to receive(:basket)
  end

  context 'Initialization' do

    it 'accepts a Menu object on initialization' do
      expect(takeaway.menu).to eq menu
    end

    it 'accepts an Order object on initialization' do
      expect(takeaway.order).to eq order
    end

  end

  context 'Selection' do

    it 'returns "Not a valid item" when passed "Peas"' do
      expect(takeaway.select_item("Peas")).to eq "Not a valid item"
    end

  end

  context 'Check if valid item' do

      it 'indicates when an item is not in the menu' do
        expect(takeaway.in_menu?("Peas")).to eq false
      end

      it 'indicates when an item is on the menu' do
        expect(takeaway.in_menu?("Spag_Bol")).to eq true
      end

  end

  context 'Basket' do

    it 'is expected to respond to add_to_basket' do
      expect(takeaway).to respond_to(:add_to_basket)
    end

  end

  context 'Calculate Total' do

    it 'calculates total cost' do
      expect(takeaway.calculate_total([{:item=>"Pizza",:qty=>3},{:item=>"Spag_Bol",:qty=>3}])).to eq 31.50
    end

  end


  # context 'Accepting Order' do
  #
  #   it 'sends a payment confirmation text message' do
  #     expect(takeaway.accept_order(20.93)).to eq "Thank you for your order: £20.93"
  #   end
  #
  # end


end
