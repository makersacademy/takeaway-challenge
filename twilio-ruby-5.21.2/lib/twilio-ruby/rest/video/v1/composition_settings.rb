##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Video < Domain
      class V1 < Version
        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionSettingsList < ListResource
          ##
          # Initialize the CompositionSettingsList
          # @param [Version] version Version that contains the resource
          # @return [CompositionSettingsList] CompositionSettingsList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Video.V1.CompositionSettingsList>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionSettingsPage < Page
          ##
          # Initialize the CompositionSettingsPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [CompositionSettingsPage] CompositionSettingsPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of CompositionSettingsInstance
          # @param [Hash] payload Payload response from the API
          # @return [CompositionSettingsInstance] CompositionSettingsInstance
          def get_instance(payload)
            CompositionSettingsInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Video.V1.CompositionSettingsPage>'
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionSettingsContext < InstanceContext
          ##
          # Initialize the CompositionSettingsContext
          # @param [Version] version Version that contains the resource
          # @return [CompositionSettingsContext] CompositionSettingsContext
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/CompositionSettings/Default"
          end

          ##
          # Fetch a CompositionSettingsInstance
          # @return [CompositionSettingsInstance] Fetched CompositionSettingsInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            CompositionSettingsInstance.new(@version, payload, )
          end

          ##
          # Retrieve a single page of CompositionSettingsInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name Friendly name of the configuration to be shown in
          #   the console
          # @param [String] aws_credentials_sid SID of the Stored Credential resource `CRxx`
          # @param [String] encryption_key_sid SID of the Public Key resource `CRxx`
          # @param [String] aws_s3_url Identity of the external location where the
          #   compositions should be stored. We only support DNS-compliant URLs like
          #   `http://<my-bucket>.s3-<aws-region>.amazonaws.com/compositions`,  where
          #   `compositions` is the path where you want compositions to be stored.
          # @param [Boolean] aws_storage_enabled `true|false` When set to `true`, all
          #   Compositions will be written to the `AwsS3Url` specified above. When set to
          #   `false`, all Compositions will be stored in Twilio's cloud.
          # @param [Boolean] encryption_enabled `true|false` When set to `true`, all
          #   Compositions will be stored encrypted. Dafault value is `false`
          # @return [CompositionSettingsInstance] Newly created CompositionSettingsInstance
          def create(friendly_name: nil, aws_credentials_sid: :unset, encryption_key_sid: :unset, aws_s3_url: :unset, aws_storage_enabled: :unset, encryption_enabled: :unset)
            data = Twilio::Values.of({
                'FriendlyName' => friendly_name,
                'AwsCredentialsSid' => aws_credentials_sid,
                'EncryptionKeySid' => encryption_key_sid,
                'AwsS3Url' => aws_s3_url,
                'AwsStorageEnabled' => aws_storage_enabled,
                'EncryptionEnabled' => encryption_enabled,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            CompositionSettingsInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.CompositionSettingsContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.CompositionSettingsContext #{context}>"
          end
        end

        ##
        # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
        class CompositionSettingsInstance < InstanceResource
          ##
          # Initialize the CompositionSettingsInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @return [CompositionSettingsInstance] CompositionSettingsInstance
          def initialize(version, payload)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'aws_credentials_sid' => payload['aws_credentials_sid'],
                'aws_s3_url' => payload['aws_s3_url'],
                'aws_storage_enabled' => payload['aws_storage_enabled'],
                'encryption_key_sid' => payload['encryption_key_sid'],
                'encryption_enabled' => payload['encryption_enabled'],
                'url' => payload['url'],
            }

            # Context
            @instance_context = nil
            @params = {}
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [CompositionSettingsContext] CompositionSettingsContext for this CompositionSettingsInstance
          def context
            unless @instance_context
              @instance_context = CompositionSettingsContext.new(@version, )
            end
            @instance_context
          end

          ##
          # @return [String] The Twilio Account SID associated with this item
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] Friendly name of the configuration to be shown in the console
          def friendly_name
            @properties['friendly_name']
          end

          ##
          # @return [String] SID of the Stored Credential resource CRxx
          def aws_credentials_sid
            @properties['aws_credentials_sid']
          end

          ##
          # @return [String] URL of the S3 bucket where the compositions should be stored. We only support DNS-compliant URLs like http://<my-bucket>.s3-<aws-region>.amazonaws.com/compositions, where compositions is the path where you want compositions to be stored.
          def aws_s3_url
            @properties['aws_s3_url']
          end

          ##
          # @return [Boolean] true|false When set to true, all Compositions will be written to the AwsS3Url specified above. When set to false, all Compositions will be stored in Twilio's cloud.
          def aws_storage_enabled
            @properties['aws_storage_enabled']
          end

          ##
          # @return [String] SID of the Public Key resource CRxx
          def encryption_key_sid
            @properties['encryption_key_sid']
          end

          ##
          # @return [Boolean] true|false When set to true, all Compositions will be stored encrypted.
          def encryption_enabled
            @properties['encryption_enabled']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # Fetch a CompositionSettingsInstance
          # @return [CompositionSettingsInstance] Fetched CompositionSettingsInstance
          def fetch
            context.fetch
          end

          ##
          # Retrieve a single page of CompositionSettingsInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name Friendly name of the configuration to be shown in
          #   the console
          # @param [String] aws_credentials_sid SID of the Stored Credential resource `CRxx`
          # @param [String] encryption_key_sid SID of the Public Key resource `CRxx`
          # @param [String] aws_s3_url Identity of the external location where the
          #   compositions should be stored. We only support DNS-compliant URLs like
          #   `http://<my-bucket>.s3-<aws-region>.amazonaws.com/compositions`,  where
          #   `compositions` is the path where you want compositions to be stored.
          # @param [Boolean] aws_storage_enabled `true|false` When set to `true`, all
          #   Compositions will be written to the `AwsS3Url` specified above. When set to
          #   `false`, all Compositions will be stored in Twilio's cloud.
          # @param [Boolean] encryption_enabled `true|false` When set to `true`, all
          #   Compositions will be stored encrypted. Dafault value is `false`
          # @return [CompositionSettingsInstance] Newly created CompositionSettingsInstance
          def create(friendly_name: nil, aws_credentials_sid: :unset, encryption_key_sid: :unset, aws_s3_url: :unset, aws_storage_enabled: :unset, encryption_enabled: :unset)
            context.create(
                friendly_name: friendly_name,
                aws_credentials_sid: aws_credentials_sid,
                encryption_key_sid: encryption_key_sid,
                aws_s3_url: aws_s3_url,
                aws_storage_enabled: aws_storage_enabled,
                encryption_enabled: encryption_enabled,
            )
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.CompositionSettingsInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.CompositionSettingsInstance #{values}>"
          end
        end
      end
    end
  end
end