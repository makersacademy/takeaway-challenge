require 'text_message'

describe Text do

 let(:text) { Text.new}
 #let(:content){('Hello', '+447590606244')}

xit 'sends text' do
 
 expect(text.send_text('Hello', ['+447590606244'])).to eq 0
end

end