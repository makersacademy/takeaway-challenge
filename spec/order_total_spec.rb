require 'order_total'

describe OrderTotal do

  let(:burger_description) {"Cheeseburger"}
  let(:burger_price) {4.99}
  let(:burger_to_s) {"#{burger_description}\t#{burger_price}"}
  let(:burger) do double :dish,
                  description: burger_description,
                  price: burger_price,
                  to_s: burger_to_s
  end
  let(:kebab_description) {"Kebab"}
  let(:kebab_price) {3.00}
  let(:kebab_to_s) {"#{kebab_description}\t#{kebab_price}"}
  let(:kebab) do double :dish,
                 description: kebab_description,
                 price: kebab_price,
                 to_s: kebab_to_s
  end
  let(:order_lines) {{burger =>  1, kebab =>  1}}
  let(:order) {double :order, order_lines: order_lines}
  subject(:order_total) {described_class.new}

  context 'Calculating total' do
    it {is_expected.to respond_to(:calculate).with(1).argument}

    it 'calculates to total of the order' do
      expect(order_total.calculate(order_lines)).to eq(burger_price +
                                                       kebab_price)
    end
  end
end
