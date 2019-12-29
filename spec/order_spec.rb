require 'order.rb'
require 'menu.rb'

describe Order do
  let(:menu){double(:menu, menu: {tofu: 1, broccoli: 1})}
  let(:dish_order){ { tofu: 3, broccoli: 2 } }

  subject(:order){Order.new(menu)}

  describe '#initialize' do
    it 'takes menu as an arguement and contains a hash' do
      expect(order.dish_order).to be_a Hash
    end
  end

  describe "#add" do
    context "has the dish" do
      let(:menu){double(:menu, has_dish: true)}
      it 'adds an order to dish_order' do
        subject.add("Tofu", 4)
        expect(subject.dish_order["Tofu"]).to eq(4)
      end
    end

    context "does not have the dish" do
      let(:menu){double :menu, has_dish: false}
      it 'will raise error if there is nothing there' do
        expect { subject.add(:chicken, 4)}.to raise_error "There is no such dish"
      end
    end
  end

  describe '#total' do

    #allow(subject).to receive(:has_dish).with(:broccoli).and_return(2.00)

    it 'gives the total price of the order' do
      order.dish_order = dish_order
      allow(menu).to receive(:price).with(:tofu).and_return(1.00)
      allow(menu).to receive(:price).with(:broccoli).and_return(1.00)
      expect(order.total).to eq("£5.00")
    end
  end

  # making total cost and order total different order_total will now be private
  # describe '#order_total' do
  #   context 'different dish order'
  #   it "sums cost of dishes in dish_order" do
  #     expect(subject.order_total).to eq("£5")
  #   end
  # end
end
