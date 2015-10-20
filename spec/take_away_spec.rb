require 'take_away'
 
  describe TakeAway do

  	

  	it "customer can enter restaurant" do
  		expect(TakeAway).to respond_to(:new)
  	end

  	it "can view menu prices" do
  		expect(subject).to respond_to(:show_menu)		
  	end

  	it "can select a dish" do
  		expect(subject).to respond_to(:select_dish).with(1).argument
  	end

  	it "raises error when dish not available" do
  		 expect{ subject.select_dish("wrong_dish") }.to raise_error "I'm sorry, we don't have that dish"
 		end
   
   	it "summarises order" do 
   		expect(subject.order_summary).to be nil
   	end

   	it "places order and sends customer a text message" do 
   		expect(subject).to respond_to(:place_order)
   	end

 end   



 
  