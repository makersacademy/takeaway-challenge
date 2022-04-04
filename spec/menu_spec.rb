require_relative '../lib/menu'

describe Menu do

 describe "#lists_dishes" do
   menu = Menu.new
   it' shows a list of all dishes with prices' do
   expect(subject).to respond_to(:lists_dishes)
   end
 end  
 
 describe '#check_availability' do
   menu = Menu.new
   it 'raises an error when item is not available' do
   expect { subject.check_availability('Fish Cake') }.to raise_error 'Dish not available. Please make a new selection.'
   end
  end

end
  


