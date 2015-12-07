require 'menu'

describe Menu do

   subject(:menu) {described_class.new}
   let(:dishes) {"starter : 5\nmains : 10\ndesert : 3\n"}

  describe 'looking at a list of dishes with prices' do

    it 'returns a list of dishes with price' do
    expect{menu.show_dishes}.to output(dishes).to_stdout
    end

  end

  describe 'ordering dishes' do

    it 'prevents a customer from ordering unavailable dishes' do
      message = "Unable to place order: dish not on menu"
      expect{menu.check_all_dishes_are_on_menu({"steak": 1})}.to raise_error message
    end

  end

end
