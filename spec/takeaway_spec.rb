require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:order) { double :order,
                :current_order_string => "Corn on the Cob x1 = 1.5 \nPepsi Cola x3 = 3.0 \n",
                :running_total => 4.5 }

  describe "#read_menu" do
    it 'returns the list of items on the menu' do
      expect(takeaway.read_menu).to eq Menu.new.options
    end
  end

  it { is_expected.to respond_to(:add_food_to_order).with(2).arguments }

  describe '#show_order' do
    it 'shows the order summary as a string and the running total' do
      takeaway.add_food_to_order("Corn on the Cob")
      takeaway.add_food_to_order("Pepsi Cola", 3)
      expect(takeaway.show_order).to eq order.current_order_string + "Total = #{order.running_total.to_s}"
    end
  end

end
