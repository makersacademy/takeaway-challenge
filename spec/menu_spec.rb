require 'menu'

describe Menu do

  let(:subject) { described_class.new }

  describe 'responses' do
    it { should respond_to(:dishes) }
    it { should respond_to(:view_menu) }
  end

  describe '#view_menu' do
    it 'doesn\'t raise an error' do
      expect{subject.view_menu}.to_not raise_error
    end
    it 'returns the menu' do
      expect(subject.view_menu).to eq("Pilau Rice, £2.20\nEgg Fried Rice, £2.50\n")
    end
  end

end
