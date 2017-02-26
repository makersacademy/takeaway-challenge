require 'takeaway'

describe Takeaway do

  before (:each) do
    @dbl = double(:menu, :dishes => [{
                                      "Burger Meal" => 7,
                                      "Lobster Meal" => 10
                                    }])
  end

    subject(:takeaway) { described_class.new(@dbl) }

  describe '#print_menu' do

    it 'displays menu' do
      expect(takeaway.print_menu).to eq "Burger Meal: £7,Lobster Meal: £10"
    end
  end
  # describe '#place_order' do
  #
  #   it 'places an order for the customer' do
  #     expect(takeaway.place_order).to eq
  #   end
  #
  # end
end
