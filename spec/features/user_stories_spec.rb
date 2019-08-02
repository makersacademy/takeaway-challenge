require 'takeaway'

describe 'user stories' do
  let(:takeaway) { Takeaway.new }
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices
  it 'customers can see a list of dishes with prices' do
    expect(takeaway.menu).to be_a(Hash)
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes
  it 'customers can select several dishes' do
    takeaway.select("bread")
    takeaway.select("apples")
    expect(takeaway.current_order).to eq({bread: 1, apples: 1})
  end

  it 'customers can see a list of their orders' do
    takeaway.select("bread")
    takeaway.select("apples")
    takeaway.select("apples")
    expect(takeaway.print_current_order)
    .to eq("bread: 1 apples: 2")
  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order
  describe 'while completing orders' do
    context 'entering the correct price' do
      it 'returns delivery time' do
        takeaway.select("bread")
        takeaway.select("apples")
        takeaway.select("apples")
        expect(takeaway.complete_order(9))
        .to eq "Thank you, your order was placed"
      end
    end

    context 'entering the incorrect price' do
      it 'raises an error' do
        takeaway.select("bread")
        takeaway.select("apples")
        takeaway.select("apples")
        expect{takeaway.complete_order(10)}
        .to raise_error "Cannot complete order: Incorrect Value"
      end
    end
  end
end