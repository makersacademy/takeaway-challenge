require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:dish) { double(:dish) }
  let(:amount) { double(:amount) }
  let(:price) { double(:price) }
  before { $stdin = StringIO.new("Nandos")}


  describe '#select_dish' do

    # it 'returns the selected dish' do
    #   expect(takeaway.select_dish(dish, amount)). to eq "#{amount}x #{dish} added to your basket"
    # end

    # it 'creates a new order' do
    #   takeaway.select_dish(dish, amount)
    #   expect(takeaway.order).to be_truthy
    # end

    it 'sends the dish and amount to the order' do
      # takeaway.select_dish(dish, amount)
      allow(takeaway).to receive(:get_price) {price}
      expect(takeaway.order).to receive(:add).with(dish, price, amount)
      takeaway.select_dish(dish, amount)
    end
  end

  describe 'confirm' do
    it 'confirms that the total price is correct' do
      
    end
  end
end
