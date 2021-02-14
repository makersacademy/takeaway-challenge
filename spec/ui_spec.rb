require './ui'

describe UI do

  describe'#make_order' do
    it'gets dish_number from input' do
      input_handler = double()
      allow(input_handler).to receive(:get_dish_number){'2'}
      ui = UI.new(input_handler)
      ui.make_order
      expect(ui.dish_number).to eq '2'
    end
  end
  describe'#dish_check' do

    it'returns nothing if the dish_number is a valid value' do
      input_handler = double()
      allow(input_handler).to receive(:get_dish_number){'2'}
      ui = UI.new(input_handler)
      ui.make_order
      expect(ui.dish_check).to eq nil
    end

    it'runs start_UI again if dish_number is invalid value' do
      input_handler = double()
      allow(input_handler).to receive(:get_dish_number){'5'}
      ui = UI.new(input_handler)
      ui.make_order
      expect(ui.dish_check).to recieve(ui.start_UI).and_call_original
    end
    
  end
end
