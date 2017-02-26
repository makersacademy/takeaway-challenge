require 'takeaway'

describe Takeaway, :t do
  let(:menu) { double }
  subject(:takeaway) { described_class.new(menu) }
  before do
    @the_menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}
    allow(menu).to receive_messages(the_menu: @the_menu)
    allow(menu).to receive_messages(print_menu: @the_menu.each_with_index do |(key, val), ind|
      "#{ind+1}: #{key} -- £#{val}"
    end)
    text_message = "Your order should arrive at #{(Time.now + (60*60)).strftime('%H:%M')}"
    allow(takeaway).to receive(:send).with(text_message)
  end

  describe "#show_menu" do
    it "returns the menu" do
      expect(takeaway.show_menu).to eq(@the_menu)
    end
  end

  describe "#choose_dish" do
    it "records the user's choices" do
      dish = "Choisum"
      portions = 3
      takeaway.choose_dish(dish, portions)
      expect(takeaway.order.current_order).to eq({dish => portions})
    end

    it "doesn't allow an unknown dish to be ordered" do
      message = "Item not on menu."
      expect{takeaway.choose_dish("Pizza")}.to raise_error(message)
    end
  end

  describe "#calculate_total" do
    it "calculates the total order cost" do
      takeaway.choose_dish("Charsui pork", 2)
      takeaway.choose_dish("Drink", 3)
      takeaway.calculate_total
      expect(takeaway.total).to eq(13)
    end
  end

  describe "#check_order_cost" do
    it "checks the calculated total against the user's expected total" do
      takeaway.choose_dish("Charsui pork", 10)
      takeaway.choose_dish("Drink", 5)
      takeaway.calculate_total
      expected_cost = 1
      p message = "Your expected cost differs to the total cost of #{takeaway.total}"
      expect{takeaway.place_order(expected_cost)}.to raise_error(message)
    end
  end

end
