require 'custy'


 describe "custy" do
     
     subject(:custy) { described_class.new(class_double) }
     
     
      it "is initialised with a empty array by default" do
          c = Custy.new
          c.food_order
        expect(c.food_order).to eq []
      end

    
    
        it "checks that subtotal is pushed to food_order" do
            c = Custy.new
            c.subtotal
            expect(custy.select_food).to recieve(menu)
        
        end
        
        
        
        
        
        
        
    end