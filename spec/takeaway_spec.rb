require 'takeaway'
require 'dish'

describe Takeaway do 

#subject(:takeaway) { described_class.new}
let(:dish_class) {double(:dish_class, new: dish)}
let(:dish) {double(:dish)}
#is this dish the dish above?

  describe '#check_menu' do 
    before do
    allow(dish_class).to receive(:new) {[{name: 'chinese', price: 8}, {name: 'fishandchips', price: 7}, {name: 'chicken', price: 5}, {name: 'beef', price: 6}]}
    end

    it 'displays list of dishes and prices' do 
      
      dish = dish_class.new
      #how to use the double dish above, instead of creating a new double here. (it didnt work)
      p dish
      expect(dish).to receive(:display_list) 
      #couldnt put dish_class.new here
      subject.check_menu(dish)
 
      #?? return vs puts
    end 
  end 

  # describe '#select_meal' do 
  #   it 'selects meal and returns the whole meal' do 
      
  #     subject.select('chicken')
  #     subject.select('chinese')
  #     expect(subject.takeaway).to eq [{name: 'chicken', price: 5}, {name: 'chinese', price: 8}]
    
  #   end

  # end 




end 