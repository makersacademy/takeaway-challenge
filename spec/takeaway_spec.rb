require 'takeaway'

describe Takeaway do
  
  let(:takeaway) { Takeaway.new }
  let(:dish) { double(name: 'name', price: 'price') }
  
  it 'has a menu' do
    expect(takeaway).to respond_to(:menu_list)
  end

  describe '#show_menu' do
    
    it 'shows a list of dishes with prices' do
      3.times { takeaway.menu_list << dish }
      expect(takeaway.show_menu).to eq 'name - price, name - price, name - price'
    end
  end
end