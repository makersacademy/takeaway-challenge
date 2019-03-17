##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Messaging
      class V1 < Version
        ##
        # Initialize the V1 version of Messaging
        def initialize(domain)
          super
          @version = 'v1'
          @sessions = nil
          @services = nil
          @webhooks = nil
        end

        ##
        # @param [String] sid A 34 character string that uniquely identifies this
        #   resource.
        # @return [Twilio::REST::Messaging::V1::SessionContext] if sid was passed.
        # @return [Twilio::REST::Messaging::V1::SessionList]
        def sessions(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @sessions ||= SessionList.new self
          else
            SessionContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The sid
        # @return [Twilio::REST::Messaging::V1::ServiceContext] if sid was passed.
        # @return [Twilio::REST::Messaging::V1::ServiceList]
        def services(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @services ||= ServiceList.new self
          else
            ServiceContext.new(self, sid)
          end
        end

        ##
        # @return [Twilio::REST::Messaging::V1::WebhookContext]
        def webhooks
          @webhooks ||= WebhookContext.new self
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Messaging::V1>'
        end
      end
    end
  end
end