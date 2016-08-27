require 'restaurant'

describe Restaurant do

  let(:dishes_class) {double :dishes_class, new: test_dishes}
  let(:test_dishes) {double :test_dishes, dishes: {
    chicken: { name: "Rotisserie chicken",
      price: 15,
      quantity: 10
    },
    spinach: {
      name: "Wilted spinach",
      price: 3,
      quantity: 80
    }, potatoes: {
      name: "Roasted potatoes",
      price: 5,
      quantity: 50
    }
  }}

  describe "#initialize" do

    it 'should create a new dishes object' do
      expect(subject.dishes.dishes).to eq test_dishes.dishes
    end

    it 'should set the current order to nil' do
      expect(subject.current_order).to eq nil
    end

  end

  describe "#avilable_dishes" do

    it 'should get a list of avilable_dishes' do
      expect(subject.available_dishes).to eq test_dishes.dishes
    end

  end

  describe "#create_new_order" do

    let(:order_class) {double :order_class, new: new_order}
    let(:new_order) {double :new_order, start_order: nil, sum: 39, list: [[:chicken,1],[:spinach,3],[:potatoes,2]]}
    
    before(:each) do
      @sum = 39
      @list = [[:chicken,1],[:spinach,3],[:potatoes,2]]
    end

    it 'should create new Order object and send it the selected dishes' do
      subject.create_new_order(@list,@sum)
      expect(new_order).to have_received(start_order).with(@list,@sum)
    end

  end

  describe '#confirm_order' do

    it 'should raise an error if total does not match correct sum of dishes' do
      expect{subject.create_new_order(@list,@sum)}.to raise_error "Wrong total!"
    end

    it 'should create new Message object and send it a confirm instruction' do

    end

  end

  describe '#close_order' do

    let(:order_class) {double :order_class, new: new_order}
    let(:new_order2) {double :new_order, start_order: nil, sum: 34, list: [[:chicken,1],[:spinach,3],[:potatoes,2]]}

    before(:each) do
      @sum = 34
      @list = [[:chicken,1],[:spinach,3],[:potatoes,2]]
      subject.create_new_order(@list,@sum)
      subject.close_order
    end

    it 'should update the order history' do
      expect(subject.order_history).to include new_order2
    end

    it 'should reset current order to nil' do
      expect(subject.current_order).to eq nil
    end

  end

end
