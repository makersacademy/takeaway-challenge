require 'order_process'

describe OrderProcess do

  subject(:new_order) { described_class.new}
  let(:dish_selection) { double(:dish_selection) }
  let(:dishes) { double(:dishes) }


  before(:each) do
    allow(dish_selection).to receive(:selected).and_return([dishes])

  end

  describe "receive dishes from DishSelection" do

    it 'ammends order array' do
      new_order.order << dish_selection.selected
      expect(new_order.order).to include([dishes])
    end

    describe " displays the options menu" do
      specify { expect { new_order.pretty_food_list }.to output.to_stdout }
    end

  end
end
