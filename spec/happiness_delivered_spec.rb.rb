require 'happiness_delivered'
require 'sandcream'

describe Happiness_Delivered do
  let(:sandcream) { Sandcream.new }
  
  context 'respond to methods' do
    it { is_expected.to respond_to(:print_menu_options) }
    it { is_expected.to respond_to(:interactive_menu) }
    it { is_expected.to respond_to(:interface) }
    it { is_expected.to respond_to(:print_menu) }
    it { is_expected.to respond_to(:select_order) }
    it { is_expected.to respond_to(:review_order) }
    it { is_expected.to respond_to(:complete_order) }
  # it { is_expected.to respond_to(:print_menu_options).with(1).argument }
  end

  describe '#initialize' do
    it 'menu is a Sandcream object' do
      expect(subject.menu).to be_a Sandcream
    end

    it 'basket is empty' do
      expect(subject.basket).to be_empty
    end

    it 'order_total to be zero' do
      expect(subject.order_total).to eq 0
    end
  end

  
end