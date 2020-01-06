require "text"

describe Text do

  subject(:text) { Text.new(client: client) }

  let(:client) { double((:client)) }
  
  xit "delivers a text with the estimated time" do
    text.deliver
  end
end