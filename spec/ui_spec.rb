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
  end

  describe 'dish_amount' do
    it'gets dish_amount from user input' do
      input_handler = double()
      allow(input_handler).to receive(:get_dish_quantity){'2'}
      allow(input_handler).to receive(:get_dish_number){'2'}
      ui = UI.new(input_handler)
      ui.dish_amount
      expect(ui.dish_quantity).to eq '2'
    end
  end

  describe 'dish_amount_check' do
    it'returns nil if the dish_quantity is valid value' do
      input_handler = double()
      allow(input_handler).to receive(:get_dish_quantity){'2'}
      allow(input_handler).to receive(:get_dish_number){'2'}
      ui = UI.new(input_handler)
      ui.dish_amount
      expect(ui.dish_amount_check).to eq nil
    end
  end
  describe 'add_more?' do
    it'returns true if input == yes' do
      input_handler = double()
      allow(input_handler).to receive(:complete){'yes'}
      ui = UI.new(input_handler)
      expect(ui.add_more?).to eq true
    end
  end

  describe 'order?' do
    it'returns true if user_input == yes' do
      input_handler = double()
      allow(input_handler).to receive(:complete){'yes'}
      ui = UI.new(input_handler)
      expect(ui.order?).to eq true
    end
  end

  describe 'start_ui' do
    it'ordinates process of ordering food from start to sending text message with valid inputs' do
      input_handler = double()
      allow(input_handler).to receive(:get_dish_quantity){'2'}
      allow(input_handler).to receive(:get_dish_number){'2'}
      allow(input_handler).to receive(:complete){'no'}
      text = double()
      allow(text).to receive(:send_message){'true'}
      ui = UI.new(input_handler,Basket.new,Menu.new,text)
      expect(ui.start_UI).to eq "true"
    end
  end


  end
