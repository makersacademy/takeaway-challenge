require 'order'

describe Order do
  let(:dish) { double :dish, name: 'name', price: 5 }
  let(:menu) { double :menu, dishes: [dish] }
  subject { described_class.new(menu) }
  
  describe '#initialization' do
    context 'when initialized with incorrect number of arguements' do
      it { expect { Order.new }.to raise_error(ArgumentError) }
    end

    context 'when initialized with correct number of arguements' do
      it { expect(Order.new(menu)).to be_a(Order) }
    end
  end

  describe '#select_dish' do
    it { is_expected.to respond_to(:select_dish).with(1).argument }
    
    context "when given a correct dish name" do
      it "should add dish to selection" do
        expect { subject.select_dish(dish.name) }.to change { subject.selection }.from([]).to([dish]) 
      end 

      it "should update the total" do
        expect { subject.select_dish(dish.name) }.to change { subject.total }.from(0).to(dish.price)
      end
    end

    context "when given an incorrect dish name" do
      it "raises an error" do
        expect { subject.select_dish('wrong name') }.to raise_error 'That dish does not exist.'
      end 
    end
  end

  describe '#review_selection' do
    it { is_expected.to respond_to(:review_selection) }

    it "prints selection and gives total" do
      expect { subject.review_selection }.to output.to_stdout
    end
  end
end
