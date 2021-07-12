require 'takeaway'

describe Takeaway do

  # pass a menu object into takeaway rather than
  # have it in the takeaway class
  subject { described_class.new(menu) }

  # create double for menu object with the method show_menu
  # this method returns the list of dishes
  let(:menu) { double(:menu, display_menu: list_of_dishes) }

  let(:list_of_dishes) { {margherita_pizza: 10, spicy_pizza: 11, mushroom_pizza: 11} }

  describe '#view_menu' do
    it { is_expected.to respond_to(:view_menu)}

    it 'displays a list of dishes' do
      expect(subject.view_menu).to eq(list_of_dishes)
    end
  end
end