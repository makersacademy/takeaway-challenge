##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class IpMessaging
      class V2 < Version
        ##
        # Initialize the V2 version of IpMessaging
        def initialize(domain)
          super
          @version = 'v2'
          @credentials = nil
          @services = nil
        end

        ##
        # @param [String] sid The sid
        # @return [Twilio::REST::Ip_messaging::V2::CredentialContext] if sid was passed.
        # @return [Twilio::REST::Ip_messaging::V2::CredentialList]
        def credentials(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @credentials ||= CredentialList.new self
          else
            CredentialContext.new(self, sid)
          end
        end

        ##
        # @param [String] sid The sid
        # @return [Twilio::REST::Ip_messaging::V2::ServiceContext] if sid was passed.
        # @return [Twilio::REST::Ip_messaging::V2::ServiceList]
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
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::IpMessaging::V2>'
        end
      end
    end
  end
end