require 'takeaway'

describe Takeaway do
  
  let(:takeaway) { Takeaway.new }
  let(:dish) { double(name: 'name', price: 'price') }
  
  it 'has a menu' do
    expect(takeaway).to have_attributes(menu_list: [])
  end

  describe '#show_menu' do
    
  it 'shows a list of dishes with prices' do
      3.times { takeaway.menu_list << dish }
      expect(takeaway.show_menu).to eq 'name - price, name - price, name - price'
    end
  end

  describe '#make_order' do
    it 'makes an order' do
      expect(takeaway.make_order).to be_an_instance_of(Order)
    end
  end
end