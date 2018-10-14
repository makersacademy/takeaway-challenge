require 'restaurant'

describe Restaurant do
  context "placing an order" do
    let(:item) { double(:ItemClass, name: "Burger", price: 6) }
    let(:order) { double(:order, add: true, view_order: item) }
    let(:texter) { double(:texter, send: true) }
    # it "creates a new order" do
    #   subject.new_order("Fake number")
    #   subject.add(item, 1)
    #   expect(subject.view_order).to eq item
    # end
    # it 'sends a text when ordered' do
    #   expect(subject.place_order).to eq true
    # end
  end
end
