require 'takeaway_dish'

describe TakeawayDish do
  let(:name) { "Szechuan Chilli Beef" }
  let(:cost) { 6.50 }
  let(:args) { { :name => name, :cost => cost } }
  let(:takeaway_dish) { TakeawayDish.new(args) }

  context 'initialize' do
    it 'successfully instantiates the Takeaway_dish class' do
      expect(takeaway_dish).to be_instance_of(TakeawayDish)
    end

    describe '#name' do
      it "returns the name of the takeaway_dish" do
        expect(takeaway_dish.name).to eq("Szechuan Chilli Beef")
      end
    end

    describe '#price' do
      it "returns the price of the takeaway_dish" do
        expect(takeaway_dish.cost).to eq(6.50)
      end
    end
  end
end
