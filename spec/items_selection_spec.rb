require './lib/items_selection'


  describe Select_items do

    it "sets dish and quantity according to user\'s input" do
      dbl = double("input_items":id => 3, :quantity => 4)
      allow(subject.input_items).to receive(:gets).and_return(dbl).twice
      expect(dbl).to receive(:gets).and_return(id)
      expect(dbl).to receive(:gets).and_return(quantity)
    end

    # it "sets dish and quantity according to user\'s input" do
    #   subject.input_items
    # end
    #   expect("input selection", :dish => "3", :quantity => "4")
    #   expect(subject.instance_variable_get(dish)).to eq :dish
    #   expect(subject.instance_variable_get(quantity)).to eq :quantity
    # end

end
