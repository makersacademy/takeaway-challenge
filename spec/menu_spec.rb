require 'menu'

describe Menu do
    subject(:menu) { described_class.new }
    let(:order1) { {number0: 0, starter1: :soup, price: 5, quantity: 1} }

      it "should return users order" do
         expect(menu.make_selection(0, 1)).to include(order1)
      end
end
