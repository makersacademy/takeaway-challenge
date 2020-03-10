require 'order'
require 'menu'

describe Order do
  it { is_expected.to respond_to(:add).with(2).arguments }
  it { is_expected.to respond_to(:show_order) }
  it { is_expected.to respond_to(:total) }
  it { is_expected.to respond_to(:checkout) }
  it { is_expected.to respond_to(:place_order) }

  it "has attribute order" do
    expect(subject).to have_attributes(order_list: [])
  end

  context '#order_list' do
    it "stores dish that has been order" do
      subject.add("Vodka", 2)
      expect(subject.order_list).to eq([{ "Vodka" => 5 }, { "Vodka" => 5 }])
    end

    it "stores multiple dishes that have been order" do
      subject.add("Vodka", 1)
      subject.add("Chicken Kiev", 1)
      expect(subject.order_list).to eq([{ "Vodka" => 5 }, { "Chicken Kiev" => 22 }])
    end
  end

  context '#add' do
    it "raises an error if dish is not in the menu" do
      expect { subject.add("Pizza", 1) }.to raise_error "This item is not on the menu"
    end
  end

  context '#show_order' do
    it "shows order" do
      subject.instance_variable_set(:@order_list, [{ "dish": 5 }])
      expect { subject.show_order }.to output("dish: £5\n").to_stdout
    end
  end

  context '#total' do
    it "raises an error if nothing was added to order list" do
      expect { subject.total }.to raise_error "Your order list is empty"
    end
    it "returns total price for order" do
      subject.add("Vodka", 2)
      subject.add("Chicken Kiev", 1)
      expect { subject.total }.to output("Your total is £32").to_stdout
    end
  end
end
