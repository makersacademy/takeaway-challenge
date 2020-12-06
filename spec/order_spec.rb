require 'order'
describe Order do
    
  describe "#initialize" do
    it "returns an instance of the Order class" do
      expect(subject).to be_an_instance_of Order

    end
  end

  describe '#order_dish' do
    let(:dish_name) { double :dish_name }
    # it { is_expected.to respond_to(:order_dish).with(1).argument }

    it "returns an empty list of dishes" do
      subject.order_dish(dish_name)
      expect(subject.order_list).not_to be_empty
    end
  end 

end
