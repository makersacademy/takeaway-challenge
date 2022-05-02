require 'menu'

describe Menu do
  describe '#view_dishes' do
    it 'shows a list of dishes with prices' do

      expect(subject.view_dishes).to eq({
        "Burger" => 5,
        "Chips" => 3,
        "Hot Dog" => 4,
        "Wings" => 3
      })
    end
  end

  describe '#check_if_available' do

    it 'raises an error message if the dish is not available on the menu' do
      expect{ subject.check_if_available("Pie") }.to raise_error 'That dish is not available. Please select another dish.'
    end
  end
end
