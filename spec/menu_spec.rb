require 'menu'

describe Menu do
    let(:menu){Menu.new}


    describe "Menu list" do
        it "Display method will respond to menu class" do
            menu = Menu.new
        expect(menu).to respond_to(:display)
        end
    end

    describe "#add" do
        
    end
end