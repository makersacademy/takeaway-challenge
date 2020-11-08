##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

require 'spec_helper.rb'

describe 'Message' do
  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages.create(x_twilio_webhook_enabled: 'true')
    }.to raise_exception(Twilio::REST::TwilioError)

    headers = {'X-Twilio-Webhook-Enabled' => 'true', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages',
        headers: headers,
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "body": "Hello",
          "media": null,
          "author": "message author",
          "participant_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "attributes": "{ \\"importance\\": \\"high\\" }",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "index": 0,
          "delivery": {
              "total": 2,
              "sent": "all",
              "delivered": "some",
              "read": "some",
              "failed": "none",
              "undelivered": "none"
          },
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "delivery_receipts": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts"
          }
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .messages.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_with_media responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "body": null,
          "media": [
              {
                  "sid": "MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "size": 42056,
                  "content_type": "image/jpeg",
                  "filename": "car.jpg"
              }
          ],
          "author": "message author",
          "participant_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "attributes": "{ \\"importance\\": \\"high\\" }",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "index": 0,
          "delivery": {
              "total": 2,
              "sent": "all",
              "delivered": "some",
              "read": "some",
              "failed": "none",
              "undelivered": "none"
          },
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "delivery_receipts": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts"
          }
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .messages.create()

    expect(actual).to_not eq(nil)
  end

  it "receives create_no_attributes responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "body": "Hello",
          "media": null,
          "author": "message author",
          "participant_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "attributes": "{}",
          "date_created": "2020-07-01T22:18:37Z",
          "date_updated": "2020-07-01T22:18:37Z",
          "index": 0,
          "delivery": {
              "total": 2,
              "sent": "all",
              "delivered": "some",
              "read": "some",
              "failed": "none",
              "undelivered": "none"
          },
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "delivery_receipts": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts"
          }
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .messages.create()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update(x_twilio_webhook_enabled: 'true')
    }.to raise_exception(Twilio::REST::TwilioError)

    headers = {'X-Twilio-Webhook-Enabled' => 'true', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        headers: headers,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "body": "Hello",
          "media": null,
          "author": "message author",
          "participant_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "attributes": "{ \\"importance\\": \\"high\\" }",
          "date_created": "2015-12-16T22:18:37Z",
          "date_updated": "2015-12-16T22:18:38Z",
          "index": 0,
          "delivery": {
              "total": 2,
              "sent": "all",
              "delivered": "some",
              "read": "some",
              "failed": "none",
              "undelivered": "none"
          },
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "delivery_receipts": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts"
          }
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').update()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete(x_twilio_webhook_enabled: 'true')
    }.to raise_exception(Twilio::REST::TwilioError)

    headers = {'X-Twilio-Webhook-Enabled' => 'true', }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
        headers: headers,
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').delete()

    expect(actual).to eq(true)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages/IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "body": "Welcome!",
          "media": null,
          "author": "system",
          "participant_sid": null,
          "attributes": "{ \\"importance\\": \\"high\\" }",
          "date_created": "2016-03-24T20:37:57Z",
          "date_updated": "2016-03-24T20:37:57Z",
          "index": 0,
          "delivery": {
              "total": 2,
              "sent": "all",
              "delivered": "some",
              "read": "some",
              "failed": "none",
              "undelivered": "none"
          },
          "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "delivery_receipts": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts"
          }
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .messages('IMXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                              .messages.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://conversations.twilio.com/v1/Services/ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Conversations/CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX/Messages',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "messages"
          },
          "messages": [
              {
                  "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "body": "I like pie.",
                  "media": null,
                  "author": "pie_preferrer",
                  "participant_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "attributes": "{ \\"importance\\": \\"high\\" }",
                  "date_created": "2016-03-24T20:37:57Z",
                  "date_updated": "2016-03-24T20:37:57Z",
                  "index": 0,
                  "delivery": {
                      "total": 2,
                      "sent": "all",
                      "delivered": "some",
                      "read": "some",
                      "failed": "none",
                      "undelivered": "none"
                  },
                  "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "delivery_receipts": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts"
                  }
              },
              {
                  "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "body": "Cake is my favorite!",
                  "media": null,
                  "author": "cake_lover",
                  "participant_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "attributes": "{ \\"importance\\": \\"high\\" }",
                  "date_created": "2016-03-24T20:38:21Z",
                  "date_updated": "2016-03-24T20:38:21Z",
                  "index": 0,
                  "delivery": {
                      "total": 2,
                      "sent": "all",
                      "delivered": "some",
                      "read": "some",
                      "failed": "none",
                      "undelivered": "none"
                  },
                  "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "delivery_receipts": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts"
                  }
              },
              {
                  "sid": "IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "chat_service_sid": "ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "conversation_sid": "CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "body": null,
                  "media": [
                      {
                          "sid": "MEaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                          "size": 42056,
                          "content_type": "image/jpeg",
                          "filename": "car.jpg"
                      }
                  ],
                  "author": "cake_lover",
                  "participant_sid": "MBaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "attributes": "{ \\"importance\\": \\"high\\" }",
                  "date_created": "2016-03-24T20:38:21Z",
                  "date_updated": "2016-03-24T20:38:21Z",
                  "index": 0,
                  "delivery": {
                      "total": 2,
                      "sent": "all",
                      "delivered": "some",
                      "read": "some",
                      "failed": "none",
                      "undelivered": "none"
                  },
                  "url": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "links": {
                      "delivery_receipts": "https://conversations.twilio.com/v1/Services/ISaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Conversations/CHaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Messages/IMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Receipts"
                  }
              }
          ]
      }
      ]
    ))

    actual = @client.conversations.v1.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .conversations('CHXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX') \
                                     .messages.list()

    expect(actual).to_not eq(nil)
  end
end