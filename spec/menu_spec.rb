require 'menu'

describe Menu do
  describe '#show_menu' do
    it 'should be able to show the menu' do
      expect(subject).to respond_to(:show_menu)
    end

    it 'should be able to output the price' do
      expect(subject.dishes[:salmon]).to eq 2
    end
  end
end

