require 'order_process'

describe OrderProcess do

  subject(:new_order) { described_class.new}
  let(:dish_selection) { double(:dish_selection) }
  let(:dishes) { double(:dishes) }

  before(:each) do
    allow(dish_selection).to receive(:selected).and_return([dishes])

  end

  # create anew order ready to be filled
  # - empty array to be filled
  it { is_expected.to have_atttributes(order: [])}


  # import selected dishes from the dish selection process
  # - selected dishes in array match mocked selection
  describe "receive dishes from DishSelection" do

    it 'ammends order array' do
      new_order.order << dish_selection.selected
      expect(new_order.order).to include(dishes)
    end
  end



  # view current order
  # -total cost
  # selectd dishes


end
