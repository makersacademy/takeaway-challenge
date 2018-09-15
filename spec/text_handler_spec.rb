require 'text_handler'

RSpec.describe TextHandler do

  let(:mock_text_api_type) { double :mock_text_api_type, new: mock_text_api }
  let(:mock_text_api) { double :mock_text_api, messages: mock_messages }
  let(:mock_messages) { double :mock_messages, create: true }

  subject { described_class.new(text_api: mock_text_api_type) }

  it "should confirm orders" do
    expect(subject.confirm_order).to eq(true)
  end

end
