require './lib/items_selection'


  describe Select_items do
       before(:each) do
          choice = Select_items.new
          choice.items << {id: 2, quantity: 4}
        end

        it "fills array with menu choice" do
          choice = Select_items.new
          choice.items << {id: 2, quantity: 4}
          expect(choice.items.length).to eq(1)
        end
    end
  #   it "sets dish and quantity according to user\'s input" do
  #       choice.input_items
  #       input_items = double("input_items":id => 3, :quantity => 4)
  #     allow(subject.input_items).to receive(:gets).and_return(dbl).twice
  #     expect(dbl).to receive(:gets).and_return(id)
  #     expect(dbl).to receive(:gets).and_return(quantity)
  #   end
  # end
