require 'menu'

describe Menu do

  subject(:menu) {described_class.build_default_menu}

  describe '#print_menu' do
    it 'Prints the menu in a nice way' do
      expect{ menu.print_menu }.not_to raise_error
    end
  end

  describe "#price_total" do
    it "Responds to #price_total" do
      expect(menu).to respond_to(:price_total).with(1).argument
    end

    it "Returns the total price for all the dishes" do
      expect(menu.price_total([["3", "pizza"], ["3", "Wrap"]])).to eq 69
    end

  end


end
