require 'takeaway'
require 'order'

describe "User stories" do

let(:takeaway) {Takeaway.new(menu, order)}
let(:order) {Order.new(menu, text)}
let(:menu) {Menu.new}
let(:text) {Text.new}
let(:menu_out) {"starter : 5\nmains : 10\ndesert : 3\n"}

before do
  allow(order).to receive(:text_confirmation)
end

  describe 'User Story 1' do

    it 'allows a customer to see a list of dishes with prices' do
      expect{takeaway.show_dishes}.to output(menu_out).to_stdout
    end

  end

  describe 'User Story 2' do

    it 'allows a customer to place an order' do
      expect{takeaway.place_order("starter", 1, "desert", 3, 14)}.not_to raise_error
    end

    it 'prevents a customer from ordering unavailable dishes' do
      message = "Unable to place order: dish not on menu"
      expect{takeaway.place_order("steak", 1, 34)}.to raise_error message
    end
  end

  describe 'User Story 3' do

    it 'raises error if customer total does not match the actual total' do
      message = "Unable to place order: total doesn't match actual total"
      expect{takeaway.place_order("starter", 1, 666)}.to raise_error message
    end

  end

  describe 'User Story 4' do

    it 'sends a text message to confirm a succesful order' do
      expect(order.text).to respond_to(:send)
    end

  end





end
