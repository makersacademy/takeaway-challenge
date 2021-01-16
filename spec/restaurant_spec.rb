require 'restaurant'
require 'menu'
require 'order'


describe Restaurant do

  subject { described_class.new }
  let(:first_dish) { "Beef Burger" }
  let(:first_order) { subject.place_order(first_dish) }
  let(:second_dish) { 'Hot Dog' }
  let(:second_order) { subject.place_order(second_dish) }
  let(:full_order) { [["Beef Burger"], ["Hot Dog"]] }

  it { is_expected.to respond_to(:current_order) }
  it { is_expected.to respond_to(:view_menu) }
  it { is_expected.to respond_to(:place_order).with(1).argument }
  it { is_expected.to respond_to(:review_order) }

  describe '#initialize' do

    it 'order is empty' do
      expect(subject.current_order).to be_empty
    end
  end

  describe '#view_menu' do
    let(:menu) { "Beef Burger = £7, Double Cheese Burger = £9, Hamburger = £7, Fish Taco = £6, Hot Dog = £5, Chips = £2" }

    it 'shows the menu' do
      expect(subject.view_menu).to eq(menu)
    end
  end

  describe '#place_order' do

    it 'adds dishes to order' do
      expect{ first_order }.to change{subject.current_order}.to([[first_dish]])
    end

    it 'can add extra dishes after first order' do
      first_order
      expect { second_order }.to change{subject.current_order}.to(full_order)
    end
  end

  describe '#review_order' do

    it 'returns ordered items in a string' do
      first_order
      expect(subject.review_order).to eq(first_dish)
    end

  end
end
