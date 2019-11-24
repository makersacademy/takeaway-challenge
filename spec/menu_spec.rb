require 'menu'

describe Menu do

  describe '#display' do
    it 'should display the menu' do
      expect(subject).to respond_to(:menu)
    end

    it 'should display a list of dishes and prices' do
      expect{ subject.display }.to output("Sushi: £5\nCurry: £6\nEgg roll: £2\nSoup: £1").to_stdout
    end 
  end
end