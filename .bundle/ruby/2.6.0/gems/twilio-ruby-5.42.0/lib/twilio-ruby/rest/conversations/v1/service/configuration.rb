##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Conversations < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class ConfigurationList < ListResource
            ##
            # Initialize the ConfigurationList
            # @param [Version] version Version that contains the resource
            # @param [String] chat_service_sid The unique string that we created to identify
            #   the Service configuration resource.
            # @return [ConfigurationList] ConfigurationList
            def initialize(version, chat_service_sid: nil)
              super(version)

              # Path Solution
              @solution = {chat_service_sid: chat_service_sid}
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Conversations.V1.ConfigurationList>'
            end
          end

          class ConfigurationPage < Page
            ##
            # Initialize the ConfigurationPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ConfigurationPage] ConfigurationPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ConfigurationInstance
            # @param [Hash] payload Payload response from the API
            # @return [ConfigurationInstance] ConfigurationInstance
            def get_instance(payload)
              ConfigurationInstance.new(@version, payload, chat_service_sid: @solution[:chat_service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Conversations.V1.ConfigurationPage>'
            end
          end

          class ConfigurationContext < InstanceContext
            ##
            # Initialize the ConfigurationContext
            # @param [Version] version Version that contains the resource
            # @param [String] chat_service_sid The SID of the Service configuration resource
            #   to fetch.
            # @return [ConfigurationContext] ConfigurationContext
            def initialize(version, chat_service_sid)
              super(version)

              # Path Solution
              @solution = {chat_service_sid: chat_service_sid, }
              @uri = "/Services/#{@solution[:chat_service_sid]}/Configuration"

              # Components
              @notifications = nil
            end

            ##
            # Fetch the ConfigurationInstance
            # @return [ConfigurationInstance] Fetched ConfigurationInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              ConfigurationInstance.new(@version, payload, chat_service_sid: @solution[:chat_service_sid], )
            end

            ##
            # Update the ConfigurationInstance
            # @param [String] default_conversation_creator_role_sid The conversation-level
            #   role assigned to a conversation creator when they join a new conversation. See
            #   the {Conversation
            #   Role}[https://www.twilio.com/docs/conversations/api/role-resource] for more info
            #   about roles.
            # @param [String] default_conversation_role_sid The conversation-level role
            #   assigned to users when they are added to a conversation. See the {Conversation
            #   Role}[https://www.twilio.com/docs/conversations/api/role-resource] for more info
            #   about roles.
            # @param [String] default_chat_service_role_sid The service-level role assigned to
            #   users when they are added to the service. See the {Conversation
            #   Role}[https://www.twilio.com/docs/conversations/api/role-resource] for more info
            #   about roles.
            # @return [ConfigurationInstance] Updated ConfigurationInstance
            def update(default_conversation_creator_role_sid: :unset, default_conversation_role_sid: :unset, default_chat_service_role_sid: :unset)
              data = Twilio::Values.of({
                  'DefaultConversationCreatorRoleSid' => default_conversation_creator_role_sid,
                  'DefaultConversationRoleSid' => default_conversation_role_sid,
                  'DefaultChatServiceRoleSid' => default_chat_service_role_sid,
              })

              payload = @version.update('POST', @uri, data: data)

              ConfigurationInstance.new(@version, payload, chat_service_sid: @solution[:chat_service_sid], )
            end

            ##
            # Access the notifications
            # @return [NotificationContext] NotificationContext
            def notifications
              return NotificationContext.new(@version, @solution[:chat_service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.ConfigurationContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.ConfigurationContext #{context}>"
            end
          end

          class ConfigurationInstance < InstanceResource
            ##
            # Initialize the ConfigurationInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] chat_service_sid The unique string that we created to identify
            #   the Service configuration resource.
            # @return [ConfigurationInstance] ConfigurationInstance
            def initialize(version, payload, chat_service_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'chat_service_sid' => payload['chat_service_sid'],
                  'default_conversation_creator_role_sid' => payload['default_conversation_creator_role_sid'],
                  'default_conversation_role_sid' => payload['default_conversation_role_sid'],
                  'default_chat_service_role_sid' => payload['default_chat_service_role_sid'],
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'chat_service_sid' => chat_service_sid, }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [ConfigurationContext] ConfigurationContext for this ConfigurationInstance
            def context
              unless @instance_context
                @instance_context = ConfigurationContext.new(@version, @params['chat_service_sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique string that identifies the resource
            def chat_service_sid
              @properties['chat_service_sid']
            end

            ##
            # @return [String] The role assigned to a conversation creator user when they join a new conversation
            def default_conversation_creator_role_sid
              @properties['default_conversation_creator_role_sid']
            end

            ##
            # @return [String] The role assigned to users when they are added to a conversation
            def default_conversation_role_sid
              @properties['default_conversation_role_sid']
            end

            ##
            # @return [String] The service role assigned to users when they are added to the service
            def default_chat_service_role_sid
              @properties['default_chat_service_role_sid']
            end

            ##
            # @return [String] An absolute URL for this service configuration.
            def url
              @properties['url']
            end

            ##
            # @return [String] Absolute URL to access the push notifications configuration of this service.
            def links
              @properties['links']
            end

            ##
            # Fetch the ConfigurationInstance
            # @return [ConfigurationInstance] Fetched ConfigurationInstance
            def fetch
              context.fetch
            end

            ##
            # Update the ConfigurationInstance
            # @param [String] default_conversation_creator_role_sid The conversation-level
            #   role assigned to a conversation creator when they join a new conversation. See
            #   the {Conversation
            #   Role}[https://www.twilio.com/docs/conversations/api/role-resource] for more info
            #   about roles.
            # @param [String] default_conversation_role_sid The conversation-level role
            #   assigned to users when they are added to a conversation. See the {Conversation
            #   Role}[https://www.twilio.com/docs/conversations/api/role-resource] for more info
            #   about roles.
            # @param [String] default_chat_service_role_sid The service-level role assigned to
            #   users when they are added to the service. See the {Conversation
            #   Role}[https://www.twilio.com/docs/conversations/api/role-resource] for more info
            #   about roles.
            # @return [ConfigurationInstance] Updated ConfigurationInstance
            def update(default_conversation_creator_role_sid: :unset, default_conversation_role_sid: :unset, default_chat_service_role_sid: :unset)
              context.update(
                  default_conversation_creator_role_sid: default_conversation_creator_role_sid,
                  default_conversation_role_sid: default_conversation_role_sid,
                  default_chat_service_role_sid: default_chat_service_role_sid,
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.ConfigurationInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.ConfigurationInstance #{values}>"
            end
          end
        end
      end
    end
  end
end