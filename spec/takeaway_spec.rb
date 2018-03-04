require 'csv'
require 'takeaway'
describe Takeaway do
 menu = CSV.read('/Users/chiakimizuta/gitDir/takeaway-challenge/lib/menu.csv', col_sep: ',', converters: :numeric)
  describe '#menu' do
    it 'shows you a menu with price' do
    expect(subject.menu).to eq menu	
    end
  end
  describe '#final_order' do
    it 'shows you the dish you order and its quantity' do
      expect(subject.final_order).to be_an_instance_of(Array)
    end
  end
  describe '#sum_of_order' do  
    it 'shows you the sum of your order' do
      expect(subject.sum_of_order).to be_an_instance_of(Integer)
    end
  end
  describe '#order(dish, quantity)' do
    it 'returns final order each time' do
    dish = double(dish)
    quantity = double(1)
    expect(subject.order(dish, 1)).to be_an_instance_of(Array)
    end
  end  
  describe '#confirmation' do 
  it 'sends an SMS message of confirmation' do
    text = double("text", :confirmation => "This is a fake text")
      expect(text).to receive(:confirmation)
      text.confirmation
    end    
    it 'raises an error if the sum and the quantity are different' do
      subject.sum_correct? == false
      message = "There was an error in your order"
      expect{ subject.confirmation }.to raise_error message
    end
  
  end

  # describe '#confirmation' do
  # end
  # describe '#time' do
  #   let (:time) {double :time} 

  #   it 'returns the current time + 1h' do
  #     expect(subject.time).to eq (Time.new + 3600).strftime("%H:%M")
  #   end
  # end	
end