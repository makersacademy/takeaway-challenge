require 'takeaway'

describe TakeAway do
  let(:dish) { double :dish }
  let(:dish_class) { double(:dish_class, new: dish) }
  subject(:takeaway) { described_class.new }
  let(:name) { double :name }
  let(:quantity) { double :quantity }


  it { is_expected.to respond_to(:list_menu) }
  it { is_expected.to respond_to(:add_to_basket) }
  it { is_expected.to respond_to(:total) }

  describe '#list_menu' do
    it 'has hash of dish instances' do
      expect(takeaway.list_menu.class).to eq Hash
    end
  end

  describe '#add_to_basket' do

    it 'puts dish instances in basket' do
      expect {takeaway.add_to_basket(name,quantity)}.to change{ takeaway.basket.length }.by(1)
    end

  end





end
