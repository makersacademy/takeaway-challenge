require 'restaurant'

describe Restaurant do
  let(:new_order){described_class.new(new_menu)}
  let(:fake_menu){"Burger, \u00A38\n Fries, \u00A34\n"}
  let(:new_menu){instance_double"Menu",show:fake_menu}

  context "when call .view" do
    it "puts the menu from menu class" do
      expect{new_order.view}.to output(fake_menu).to_stdout
    end
  end

  context "when call .start_order" do
    it "can insput dish name/quantity and call 'Done'to complete ordering(e.g. 2 dishes)" do
      #Have to use add_dish as test object even it's within the metdhod,
      #cos otherwise the start_order can't be tested, as there's no output
      allow(new_order).to receive(:gets).and_return("Burger\n","1\n","Olive\n","2\n","Done\n")
      allow(new_menu).to receive(:add_dish).with("Burger", "1").ordered
      allow(new_menu).to receive(:add_dish).with("Olive", "2").ordered
      expect(new_order).to receive(:gets).and_return("Burger\n","1\n","Olive\n","2\n","Done\n")
      new_order.start_order
    end
  end

  context "when call .place_order" do
    before(:all) do
      @wrong_price = 100
      @right_price = 8
    end
    it "and the price is wrong, raise an error and print it to standard output" do
      # fake_error = double

      allow(new_menu).to receive(:total_price).and_return(@right_price)
      # allow(fake_error).to receive(:price_not_matches?).with(100).and_return(raise "Fake error")
      # p new_order.place_order(100)
      expect{new_order.place_order(@wrong_price)}.to output("Total price not match\n").to_stdout
    end


    it "and the price is correct, not to raise error to output" do
      allow(new_menu).to receive(:total_price).and_return(@right_price)
      expect{new_order.place_order(@right_price)}.to_not output("Total price not match\n").to_stdout
    end

    it "and the price is correct, confirm the order and delivery time" do
      allow(new_menu).to receive(:total_price).and_return(@right_price)
      allow(new_order).to receive(:send_text).and_return("Yo got your back bro")
      expect(new_order).to receive(:send_text).and_return("Yo got your back bro")
      new_order.place_order(@right_price)
    end
  end
end
