require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu)}

  let(:menu) { double :menu, print_menu: printed_options }
  let(:printed_options) {["Tacos £3.50"]}
  let(:order) { double :order }

  context '#show_menu' do

    it "prints menu" do
      expect(takeaway.show_menu).to eq printed_options
    end

  end

  context '#place_order' do

    it 'raises an error when a meal is not on the menu' do
      allow(menu).to receive(:has_meal?).with(any_args).and_return(false)
      expect{ takeaway.place_order("beer") }.to raise_error "Beer is not on the menu"
    end

    it 'can order any number of meals' do
      allow(menu).to receive(:has_meal?) { :true }
      expect(order).to receive(:add_meals).twice
      takeaway.place_order("nachos")
      takeaway.place_order("ribs")
    end

  end

  context '#basket contents' do

  it 'shows what meals are in your basket' do
    allow(menu).to receive(:has_meal?).and_return(true)
    takeaway.place_order("nachos")
    expect(takeaway.basket_contents).to eq "nachos"=>1
  end

  it 'returns message of empty basket if empty' do
    expect(takeaway.basket_contents).to eq "Basket is empty"
  end
end

context '#completeing order' do
  it 'raises an error if no order placed' do
    expect{ takeaway.confirm_order }.to raise_error 'No orders have been added'
  end
end

end
