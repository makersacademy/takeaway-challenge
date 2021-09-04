require 'eds_diner'

describe EdsDiner do 

  context 'I would like to see a list of dishes with prices' do
    
    it 'stores meals in a hash' do
      expect(subject.dishes).to be_instance_of(Hash)
    end

    it 'prints list of items in menu' do
      expect{subject.show_menu}.to output(include("1. Tomato Soup  £5", "2. Avocado On Toast  £7")).to_stdout
    end

  end

end
