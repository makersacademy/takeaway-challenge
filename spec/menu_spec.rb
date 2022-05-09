require 'menu'

describe Menu do

  subject(:menu) { described_class.new(items) }
  let(:items) do
    {
    chicken_curry: 6,
    veggie_pizza: 5.5,
    chilli_sauce: 1.5,
    }
  end

  it "has a list of items with prices" do
    expect(menu.items).to eq(items)
  end

  it "prints a list of items and prices" do
    printed_menu = "chicken_curry: 6, veggie_pizza: 5.5, chilli_sauce: 1.5"
    expect(menu.print).to eq(printed_menu)
  end

  context '#dish?' do

    it "checks if a dish is on the menu" do
      expect(menu.dish?(:chilli_sauce)).to be_truthy
    end
  end

  context '#price' do

    it "looks up the price of an item" do
      expect(menu.price(:chicken_curry)).to eq 6

    end
  end
end



  # context '#select_dish' do
  #
  #   it "responds to a method select_item with 2 args" do
  #     expect(subject).to respond_to(select_item).with(2).arguments
  #   end
  # end
