require 'custy'


 describe "custy" do
     
      it "is initialised with a empty array by default" do
          c = Custy.new("john")
          c.food_order
        expect(c.food_order).to eq []
      end
    
    it 'does something' do
          expect(:food_choice).to receive(:gets).and_return("Samon")
          expect(:quantity).to receive(:gets).and_return(2)
          c = Custy.new("john")
          c.select_food
          expect(c.total).to eq(3)
        end
    
        xit "checks that subtotal is pushed to food_order" do
            c = Custy.new("john")
            c.select_food
            expect(c.food_order).to be_truthy
        end
    
        
    end