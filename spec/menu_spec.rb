require 'menu'

describe Menu do 

  it 'should return a has with dishes and prices' do 
    expect(subject.view).to include("pizza", "curry", "falafel", "padthai")
  end 

  describe' #price' do 
    it 'should return the price of the selected dish' do 
      menu = Menu.new
      expect(menu.price("pizza")).to eq 10 
    end 
  end
end 