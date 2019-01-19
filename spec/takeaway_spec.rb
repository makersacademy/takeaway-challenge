require 'takeaway'

describe Takeaway do

  describe '#menu' do
    it { is_expected.to respond_to(:view_menu) }

    it "should access the menu from a Menu class" do
      expect(subject.menu).to receive(:view_food_and_price)
      subject.view_menu
    end

    # it { is_expected.to respond_to(:create_order) }

    it { is_expected.to respond_to(:place_order) }

  end

end
