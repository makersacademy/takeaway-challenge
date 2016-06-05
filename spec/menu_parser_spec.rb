describe MenuParser do

  describe ':format_menu' do
    it 'returns a string vesion of a menu' do
      expect(described_class.format_menu(MENU_1)).to eq STRING_MENU_1
    end 

    it 'returns a string vesion of another menu' do
      expect(described_class.format_menu(MENU_2)).to eq STRING_MENU_2
    end 
  end 


  MENU_1 = [{ description: 'Roast pork',       price: 15 },
            { description: 'Steamed broccoli', price:  3 },  
            { description: 'Roasted spinach',  price:  8 },  
            { description: 'Smelly fruit',     price: 12 }].freeze

  MENU_2 = [{ description: 'Roast pork',       price: 15 },
            { description: 'Steamed broccoli', price:  3 },  
            { description: 'Roasted spinach',  price:  8 }].freeze

  STRING_MENU_1 = "1 - Roast pork - £15\n"\
                  "2 - Steamed broccoli - £3\n"\
                  "3 - Roasted spinach - £8\n"\
                  "4 - Smelly fruit - £12\n".freeze

  STRING_MENU_2 = "1 - Roast pork - £15\n"\
                  "2 - Steamed broccoli - £3\n"\
                  "3 - Roasted spinach - £8\n".freeze
end 
