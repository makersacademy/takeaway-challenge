require 'takeaway'

describe Takeaway do
  
  let(:takeaway) { Takeaway.new('mcdonalds') }
  let(:dish) { double(name: 'name', price: 'price') }
  let(:data) { ["hamburger, 2\n", "cheeseburger, 3\n", "chicken nuggets, 5"] }
  
  describe '#show_menu' do
    it 'shows a list of dishes with prices' do
      allow(File).to receive(:open) { data }
      expect(takeaway.show_menu).to eq 'hamburger - 2, cheeseburger - 3, chicken nuggets - 5'
    end
  end
  
  describe '#make_order' do
    it 'makes an order' do
      expect(takeaway.make_order).to be_an_instance_of(Order)
    end
  end  

  describe '#load_menu' do
    it 'creates dishes' do
      takeaway.menu_list.each do |menu_dish|
        expect(menu_dish).to be_an_instance_of(Dish)
      end
    end
  end

  context 'when there is no menu file' do
    it 'raises an error' do
      expect { Takeaway.new('wrong_or_no_name') }.to raise_error 'No menu to load'
    end
  end
end
