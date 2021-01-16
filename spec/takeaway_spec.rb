require 'takeaway'
require 'menu'
require 'order'


describe Takeaway do

  subject { described_class.new(menu: menu) }
  let(:dishes) { { burger: 2, hamburger: 1,} }
  let(:menu) { double(:menu, see_menu: printed_menu) }


  it { is_expected.to respond_to(:view_menu) }
  it { is_expected.to respond_to(:place_order).with(1).argument }


  describe '#view_menu' do
    it 'shows the menu' do
      expect(subject.view_menu).to eq(printed_menu)
    end
  end

  describe '#place_order' do

    it 'adds dishes to order' do
      expect( subject.place_order() ).to eq('Your order total is £21')
    end
  #
  #   it 'can add extra dishes after first order' do
  #     first_order
  #     expect { second_order }.to change{subject.current_order}.to(full_order)
  #   end
  end
  #
  # describe '#review_order' do
  #
  #   it 'returns ordered items in a string' do
  #     first_order
  #     expect(subject.review_order).to eq(first_dish)
  #   end
  #
  # end
end
