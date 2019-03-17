require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do 


let(:menu_class) {double(:menu_class, new: menu)}
let(:menu) { double(:menu) }


#need to double order
subject(:takeaway) { described_class.new(order: order)}
let(:order) { double(:order) }

let(:dishes) {{chicken: 1, chinese: 2}}


#is this dish the dish above?

  describe '#check_menu' do 
    before do
    allow(menu_class).to receive(:new) {[{name: 'chinese', price: 8}, {name: 'fishandchips', price: 7}, {name: 'chicken', price: 5}, {name: 'beef', price: 6}]}
    allow(order).to receive(:add)  
  end

    it 'displays list of dishes and prices' do 
      
      menu = menu_class.new
      #how to use the double dish above, instead of creating a new double here. (it didnt work)
      p menu
      expect(menu).to receive(:display_list) 
      #couldnt put dish_class.new here
      subject.check_menu(menu)
 
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