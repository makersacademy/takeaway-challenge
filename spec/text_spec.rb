require 'text'

describe Text do
    subject(:text){described_class.new}
    
    it {is_expected.to respond_to(:send_message)}
    
end