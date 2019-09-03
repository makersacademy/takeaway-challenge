require 'menu'

describe Menu do
  
  describe '#menu_reader' do
    it 'outputs a list of menu items' do
    expect{subject.menu_reader}.to output("Korma:   £4.99\nBhuna:   £2.99\nRogan-josh:   £3.29\nPeshwari naan:   £1.99\nPoppadom:   £0.8\n").to_stdout
    end

  end
end