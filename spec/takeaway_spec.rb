require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { "Samosa: 6.50" }

  let(:order) { double(:order) }
  let(:dishes) { {samosa: 1, naan: 5} }


  it 'has an array of dishes and related prices' do
      expect(takeaway.read_menu).to eq(printed_menu)
    end

  it 'can order dishes' do
    expect(order).to receive(:add).twice
    takeaway.place_order(dishes)
  end
end

  # describe "#food" do
  #   allow(food).to receive(:food).and_return(food)
  # end
  #
  # describe "order" do
  #   it 'allows a user to add food to an order' do
  #     allow(takeaway.order(food)).to receive(:food).and_return(order)
  #   end
  # end
