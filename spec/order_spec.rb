require 'order'

describe Order do

  let(:order) { described_class.new }
  let(:menu_list) { double :mock_menu, :mock_menu_list => [{"pickled vegetables" => 2.95}, {"smoky huitlacoche, chilli sauce, vegan cheese, avocado and quesadillas" => 5.95}] }
  # let(:chosen_item) { double :mock_chosen_dishes('pickled vegetables', 2) }

  context "records order" do

    it "outputs chosen items from menu" do
      expect{ order.chosen_dishes("pickled vegetables", 2) }.to output("2 pickled vegetables added to your order\n").to_stdout
    end

    it "outputs total of items from order" do
      order.chosen_dishes("pickled vegetables", 2)
      expect(order.add_total).to eq(5.90)
    end
  end
end
