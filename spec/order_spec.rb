require 'order'
require 'twilio-ruby'
require 'dotenv/load'

describe Order do

  describe "confirm order" do

  # let(:user) { "complete order" }

    xit 'should allow user to confirm order' do
      allow(Order).to receive(:user).and_return("complete order")
      expect subject.checkout_confirmation
    end
  end
  #the above was an attempt to use gets for user input, but this messed with the rspec...

  describe '#add dishes' do

    context 'when a customer selects a dish' do
      it 'it should change the order by adding a dish to it' do
        expect { subject.add(1) }.to change(subject, :selection)
      end
    end

    context 'when a customer selects a dish' do
      it 'it should not let them pick a dish if it is not available' do
        expect { subject.add(3) }.to raise_error 'item not available'
      end
    end

    #currently the above is based on the customer requesting an item which I know to be unavailable, and so I'm effectively
    #hardcoding into the tests that anyone asking for menu item 3 will raise an error. What I need to do is (or at least if I have time)
    #is to make it so the test will adjust even if availability of that item changes (i.e. if the hash is changed so that item 3 is now available)
    #what we want is a test that imagines it as unavailable without ruining the rspec results (I say this, as if I don't already have two failing
  #tests that I don't know how to pass). So I guess this means doubling...

  #also, ideally stock would be adjusted according to what was ordered, so that the available key would return an integer rather than a boolean

    context 'a item is unavailable' do
      xit 'it should not let the customer pick the item and instead tell them it is unavailable' do
        dbl = double("unavailable item")
        dishes = []
        dishes << dbl
        allow(dbl).to receive(:add).and_raise('item not available')
        order = Order.new
        expect(order.add(4)).to raise('item not available')
      end
    end

    #could just not get doubling to work in the above case. Not even sure that it's what I'm meant to be doing
    #to make this run.




    context 'when a customer selects a meal' do
      it 'it should add the cost of that dish to the total' do
        expect { subject.add(1) }.to change(subject, :total)
      end
    end

    context 'when a customer selects a dish' do
      it 'it should change the confirmation message accordingly' do
        expect { subject.add(1) }.to change(subject, :item_added_confirmation)
      end
    end

  describe '#summary' do
      context 'when a customer has finished choosing meals and clicks on checkout' do
        it 'should show the customer their summary' do
          subject.add(1)
          # subject.stub(:gets) {"complete order"}
          expect(subject.checkout).to include(subject.selection)
        end

        it 'should prompt the customer to compare the total against the order summary' do
          subject.add(1)
          # subject.stub(:gets) {"complete order"}
          expect(subject.checkout).to include("Please check your order against your total:")
        end
      end
    end
  end

  describe '#complete_order' do
    context 'when a customer has checked their summary and enters complete_order' do
      it 'should call the SMS class' do
        subject.add(1)
        subject.checkout
        expect(subject).to respond_to(subject.complete_order).with(SMS.new.send_sms(ENV['MY_PHONE']))
      end
    end
#cannot make the above work! works in IRB, but can't get a passing test... also, when I put in my number, it seemed to be escaping the
#stub in the sms_spec at times, although the above doesn't send a text...
    context 'when a customer has checked their summary and enters complete_order' do
      it 'should be instance of SMS' do
        subject.add(1)
        subject.checkout
        expect(subject.complete_order).to_(SMS.new.send_sms)
      end
    end
  end
end
