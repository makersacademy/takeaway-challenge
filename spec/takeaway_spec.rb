require 'takeaway'

describe TakeAway do
  let(:price1) { 3.19 }
  let(:price2) { 3.40 }
  let(:price3) { 3.89 }
  let(:total) { price1 + price2 + price3 }
  let(:name1) { 'McNuggets' }
  let(:name2) { 'Big Mac' }
  let(:name3) { 'Chicken Legend' }
  let(:dish1) { double('dish', name: name1, price: price1) }
  let(:dish2) { double('dish', name: name2, price: price2) }
  let(:dish3) { double('dish', name: name3, price: price3) }
  let(:menu) { instance_double(Menu, list_of_dishes: [dish1, dish2, dish3], print: "hello, this is menu") }
  subject { described_class.new(menu) }

  context '#print_menu' do
    it { is_expected.to respond_to(:print_menu) }
  end
  
  context '#select_dish' do
    before do
      subject.select_dish(name1)
      subject.select_dish(name2)
      subject.select_dish(name3) 
    end
    
    it { is_expected.to respond_to(:select_dish).with(1).argument }

    it 'can select dishes and be added to the order list' do   
      expect(subject.customer_order).to contain_exactly(name1, name2, name3)
    end

    context '#total' do
      it { is_expected.to respond_to(:total) }
      
      xit 'can calculate the grand total' do
        allow(menu).to receive(:dish_price).and_return(price1, price2, price3)
        expect(subject.total).to eq total
      end
    end
  
  end
end
