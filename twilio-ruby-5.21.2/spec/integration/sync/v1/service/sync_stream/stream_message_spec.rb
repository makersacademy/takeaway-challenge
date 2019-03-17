##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'StreamMessage' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .sync_streams('TOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                     .stream_messages.create(data: {})
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {'Data' => Twilio.serialize_object({}), }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://sync.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Streams/TOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages',
        data: values,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "TZaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "data": {}
      }
      ]
    ))

    actual = @client.sync.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .sync_streams('TOXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                            .stream_messages.create(data: {})

    expect(actual).to_not eq(nil)
  end
end