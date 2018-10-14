require 'menu'

describe Menu do
  describe '#initialize' do
    it 'should include a hash of menu items and prices' do
      expect(subject.list.first).to eq ["muffin", 3]
    end
  end

  describe '#print_menu' do
    it 'should print a list of menu items and their prices' do
      expect { subject.print_menu }.to output.to_stdout
    end
  end

end
