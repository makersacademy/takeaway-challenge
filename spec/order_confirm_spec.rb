require './lib/order_confirm'

describe OrderConfirm do
    
    describe '#get_msg' do
        
        it 'Has a default message when called without an argument' do
            expect(subject.get_msg).to eq "Your order will be delivered in one hour"
        end
        
        it 'Allows you to supply an optional message as an argument' do
            expect(subject.get_msg("Your order will be delivered in two hours, sorry for the delay")).to eq "Your order will be delivered in two hours, sorry for the delay"
        end
        
    end
    
    describe '#get_num' do
        it 'takes a number and stores it as a string' do
            expect(subject.get_num(447845292890)).to eq "+447845292890"
        end
    end
    
    it '#send_confirm_msg' do
        is_expected.to respond_to(:send_confirm_msg)
    end
        
end