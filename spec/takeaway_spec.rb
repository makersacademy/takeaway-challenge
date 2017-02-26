require 'takeaway'

describe Takeaway do
  before (:each) do
    @dbl = double(:menu, :dishes => {
                                      1 =>["Burger Meal", 7],
                                      2 =>["Lobster Meal", 10]
                                    })
  end

    subject(:takeaway) { described_class.new(@dbl) }

  describe '#print_menu' do

    it 'displays menu' do
      expect(subject.print_menu).to eq "1. Burger Meal £5,2. Lobster Meal £5"
    end

  end
end
