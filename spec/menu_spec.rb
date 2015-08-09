require 'menu'

describe Menu do
  describe '#show_menu' do
    it 'shows the menu' do
      expect(subject).to respond_to(:show_menu)
    end

    it 'outputs the price' do
      expect(subject.dishes[:salmon]).to eq 2
    end
  end
end

