require 'menu'

describe Menu do
    
  context 'checking to see if various methods exist' do
  
  it 'expects menu to exist' do
      expect(subject).to respond_to(:menu)
  end
  
  end

  context 'checking to see if values are returned as expected' do

    it 'expects print_menu to print the menu' do
      expect{subject.print_menu}.to output("1. Korma, 10.0\n2. Katsu, 14.0\n3. Salad, 9.0\n4. Prawns, 2.5\n").to_stdout
    end

  end

end