require 'menu'
describe Menu do 
#  it 'creates a dishes array' do 
#    expect(subject.dishes).to eq []
#  end
  
  describe '#list' do 
    it 'tests list method' do 
      expect(subject).to respond_to(:list)
    end
    it 'output first dish on menu' do 
      expect { subject.list }.to output("1. Spaghetti £5\n2. Pizza £4\n").to_stdout
    end
  end
end
