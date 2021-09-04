require 'order'

describe Order do
  # change the order file as did not feel relevant to test
  context 'select avaliable items' do 
    it 'initializes with an empty array' do 
      expect(subject.select_item).to eq []
    end 

    it 'adds items to the select_item empty array' do
      subject.add_selected_item('name')
      expect(subject.select_item)
      end 
    end 
end 
