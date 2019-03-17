require 'takeaway'
require 'dish'
require 'order'

describe Takeaway do 


let(:dish_class) {double(:dish_class, new: dish)}
let(:dish) { double(:dish) }


#need to double order
subject(:takeaway) { described_class.new(order: order)}
let(:order) { double(:order) }

let(:dishes) {{chicken: 1, chinese: 2}}


#is this dish the dish above?

  describe '#check_menu' do 
    before do
    allow(dish_class).to receive(:new) {[{name: 'chinese', price: 8}, {name: 'fishandchips', price: 7}, {name: 'chicken', price: 5}, {name: 'beef', price: 6}]}
    allow(order).to receive(:add)  
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

  describe '#place_order' do 
    it 'adds dishes to order' do 
      takeaway.place_order(dishes)
      expect(takeaway.order).to eq [dishes]
    end

  end 




end 