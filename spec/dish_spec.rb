require 'dish'
require 'takeaway'

describe Dish do 
  describe '#display_list' do 

    it 'displays all the dishes and prices' do   
      expect{subject.display_list}.to output("chinese 8\nfishandchips 7\nchicken 5\nbeef 6\n").to_stdout 
    end 
  end 





end 



