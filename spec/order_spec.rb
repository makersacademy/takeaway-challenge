require 'order.rb'
require 'menu.rb'

describe Order do
  subject(:order){Order.new(menu)}
  let(:menu){double(Menu.new)}

  let(:dish_order){
    {
      tofu: 3,
      broccoli: 2
    }
  }

  describe '#initialize' do
    it 'takes menu as an arguement and contains a hash' do
      expect(subject.dish_order).to be_a Hash
    end
  end

  # is the below really necessary?
  #   before do
  #   allow(subject).to receive(:price).with(:tofu).and_return(true)
  #   allow(subject).to receive(:has_dish).with(:broccoli).and_return(true)
  #
  #   allow(subject).to receive(:has_dish).with(:tofu).and_return(3.00)
  #   allow(subject).to receive(:has_dish).with(:broccoli).and_return(2.00)
  #
  #   order.add(:tofu)
  #   order.add(:broccoli)
  # end

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
end
