require 'order'

describe Order do 

  let(:menu) { double :menu, items: { "margarita" => 5, "fries" => 3 } }
  subject(:order) { described_class.new(menu) }

  describe '#initialize' do
    it 'has no orders to begin with' do
      expect(subject.basket).to eq({})
    end
  end

  describe '#add_item' do
   
    it 'checks that is responds to two arguments' do
      expect(subject).to respond_to(:add_item).with(2).arguments
    end

    it 'adds an item to the basket' do
      expect { subject.add_item("margarita") }.to change { subject.basket.count }.by(1)
    end
  end

  describe "#total_order" do 

    it 'gives total sum of order' do
      subject.add_item("margarita", 2)
      subject.add_item("fries", 1)
      expect(subject.total_order).to eq(13)
    end
  end 
end

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order
