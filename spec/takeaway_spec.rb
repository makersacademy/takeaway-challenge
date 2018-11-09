require 'take_away'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  context '#initialize class' do
    it 'expects the pricelist to be empty at initialize' do
      expect(takeaway.pricelist).to be_empty
    end
  end

  it 'should show the price list' do
    expect(takeaway.show_price_list).to eq takeaway.show_price_list
  end

  it 'should let customer allow customer to select an item and add it to the selection' do
    takeaway.add_order("Jacket Potato with cheese", 2, 3.00)
    expect(takeaway.pricelist).to eq [["Jacket Potato with cheese", 2, 3.00]]
  end

  it 'should produce a total' do
    takeaway.add_order("Jacket Potato with cheese", 2, 3.00)
    expect(takeaway.total).to eq 6
  end

  # it "expect to produce error message if the totals do not match" do
  #   expect(takeaway.compile_total).to raise_error "Incorrect total added"
  # end

  it "expects to show confirmation message, when order has been placed" do
    expect(takeaway.place_order).to eq "Thank you your order has been placed"
  end
end
