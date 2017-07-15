require './lib/takeaway.rb'

RSpec.describe Takeaway do
let(:burger)  { Menu::BURGERS }
let(:subject) { Takeaway.new  }
 
    describe "menu" do
      it { expect(subject).to respond_to(:menu) }
      it "displays menu" do
         expect(subject.menu).not_to be_empty
      end

      it "checks menu is a hash" do
          expect((subject.menu).is_a?(Hash)).to be_truthy
      end

      it "checks menu price is not nil" do
          expect(burger).not_to have_value(nil)
      end

      it "checks menu price is not zero" do
          expect(burger).not_to have_value(0)
      end 

      it "checks dish name is a symbol" do
          burger.each do |k, v|
            expect(k).to be_a(Symbol)
          end
      end


    end
end
