
require 'takeaway'

describe Takeaway do

  it 'Displays menu' do 

    expect(subject.menu_list).to eq(  { "£5.99 Chicken tikka" => 1, "£4.50 Korma" => 2 })

  end
  
  it 'Gives user instructions' do 

    expect(subject.menu_instructions_display).to eq("Enter the number of your selected dish")

  end
   

 describe '#menu_take_input' do
    it { is_expected.to respond_to(:menu_take_input).with(1).argument }
    it 'Takes in dish number' do 
      expect{ subject.menu_take_input 1 }.to change{ subject.dish_number}.by 1 

    end
    end
    
    
 describe '#show_selected' do

    before do

   subject.menu_take_input(1)
 
 end
  it 'Shows selection' do
  expect(subject.show_selected).to eql( "£5.99 Chicken tikka")
 end
 end
 
 
 describe '#add_order' do

    before do
   subject.menu_take_input(1)
   subject.show_selected
   end
     it 'adds order' do
     expect(subject.add_order).to eql( ["£5.99 Chicken tikka"])
 end
 end
 
 describe '#show_total' do

    before do
   subject.menu_take_input(1)
   subject.show_selected
   subject.add_order

   end
     it 'shows total' do
  expect(subject.show_total).to eql( 5.99)

end
end
 

end