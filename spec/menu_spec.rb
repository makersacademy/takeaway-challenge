require 'menu'

class Inquisitor
  def gets_input
    [gets]
  end
end

# RSpec.describe Inquisitor do
#   describe '#gets_input' do
#     it 'calls gets once' do
#       inq = Inquisitor.new
#       allow(inq).to receive(:gets).and_return('Apricot', 'Banana')
#       expect(inq.gets_twice).to eq(%w[Apricot Banana])
#     end
#   end
# end

describe Menu do

  xit { is_expected.to be_an_instance_of(Menu) }

  it "can print the menu" do
    expect(:print_menu).to be
  end


  context "user add 1 item to basket" do
    # let!(:user_input) { double("user") } 
    let!(:menu)  { Menu.new }
    describe '#gets_input' do
      it 'calls gets once' do
        inq = Inquisitor.new
        allow(inq).to receive(:gets).and_return('Apricot', 'Banana')
        expect(inq.gets_twice).to eq(%w[Apricot Banana])
      end
    end

   it "lets customer add item to the basket" do
    # user select #2 [ "KFC", 6 ]
    #   allow_any_instance_of(Object).to receive(:gets).and_return(2)
    #   inq = Inquisitor.new
      menu = Menu.new


    #   allow(inq).to receive(:gets).and_return(2)
    #   expect(inq.gets_input).to eq(2)  
    #   allow(:print_menu).to_receive(2)
    #   allow_any_instance_of(Menu).to receive(:print)
    #   expect(menu).to receive(:puts).with(1)

      allow(:print_menu).to_receive(2)
      expect(menu.basket).to be("KFC")
    end
  end
end
