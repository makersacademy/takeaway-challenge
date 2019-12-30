require 'menu'

describe Menu do 

  describe 'menu' do 
    it 'should contain a hash with first menu item' do 
      expect(subject.menu).to include ({pizza: 10} and {pasta: 8} and {pasta: 8} and {pasta: 8} and {chili: 12})
    end 

    it 'should start with pizza' do 
      expect(subject.menu).to start_with ({pizza: 10})
    end 

    it 'should be 5 items long' do 
      expect(subject.menu.length).to eq(5)
    end 

  end 

  describe '#print_menu' do
    it 'displays each menu item to the user' do
      expect(subject).to respond_to(:print_menu)
    end
    it 'should be a string, i.e. return nil' do 
      expect(subject.print_menu).to be_nil
    end 
  end

end 