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
          class BindingList < ListResource
            ##
            # Initialize the BindingList
            # @param [Version] version Version that contains the resource
            # @param [String] chat_service_sid The SID of the {Conversation
            #   Service}[https://www.twilio.com/docs/conversations/api/service-resource] the
            #   Binding resource is associated with.
            # @return [BindingList] BindingList
            def initialize(version, chat_service_sid: nil)
              super(version)

              # Path Solution
              @solution = {chat_service_sid: chat_service_sid}
              @uri = "/Services/#{@solution[:chat_service_sid]}/Bindings"
            end

            ##
            # Lists BindingInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [binding.BindingType] binding_type The push technology used by the
            #   Binding resources to read.  Can be: `apn`, `gcm`, or `fcm`.  See {push
            #   notification
            #   configuration}[https://www.twilio.com/docs/chat/push-notification-configuration]
            #   for more info.
            # @param [String] identity The identity of a {Conversation
            #   User}[https://www.twilio.com/docs/conversations/api/user-resource] this binding
            #   belongs to. See {access
            #   tokens}[https://www.twilio.com/docs/conversations/create-tokens] for more
            #   details.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(binding_type: :unset, identity: :unset, limit: nil, page_size: nil)
              self.stream(
                  binding_type: binding_type,
                  identity: identity,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams BindingInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [binding.BindingType] binding_type The push technology used by the
            #   Binding resources to read.  Can be: `apn`, `gcm`, or `fcm`.  See {push
            #   notification
            #   configuration}[https://www.twilio.com/docs/chat/push-notification-configuration]
            #   for more info.
            # @param [String] identity The identity of a {Conversation
            #   User}[https://www.twilio.com/docs/conversations/api/user-resource] this binding
            #   belongs to. See {access
            #   tokens}[https://www.twilio.com/docs/conversations/create-tokens] for more
            #   details.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(binding_type: :unset, identity: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(binding_type: binding_type, identity: identity, page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields BindingInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of BindingInstance records from the API.
            # Request is executed immediately.
            # @param [binding.BindingType] binding_type The push technology used by the
            #   Binding resources to read.  Can be: `apn`, `gcm`, or `fcm`.  See {push
            #   notification
            #   configuration}[https://www.twilio.com/docs/chat/push-notification-configuration]
            #   for more info.
            # @param [String] identity The identity of a {Conversation
            #   User}[https://www.twilio.com/docs/conversations/api/user-resource] this binding
            #   belongs to. See {access
            #   tokens}[https://www.twilio.com/docs/conversations/create-tokens] for more
            #   details.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of BindingInstance
            def page(binding_type: :unset, identity: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'BindingType' => Twilio.serialize_list(binding_type) { |e| e },
                  'Identity' => Twilio.serialize_list(identity) { |e| e },
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              BindingPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of BindingInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of BindingInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              BindingPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Conversations.V1.BindingList>'
            end
          end

          class BindingPage < Page
            ##
            # Initialize the BindingPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [BindingPage] BindingPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of BindingInstance
            # @param [Hash] payload Payload response from the API
            # @return [BindingInstance] BindingInstance
            def get_instance(payload)
              BindingInstance.new(@version, payload, chat_service_sid: @solution[:chat_service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Conversations.V1.BindingPage>'
            end
          end

          class BindingContext < InstanceContext
            ##
            # Initialize the BindingContext
            # @param [Version] version Version that contains the resource
            # @param [String] chat_service_sid The SID of the {Conversation
            #   Service}[https://www.twilio.com/docs/conversations/api/service-resource] the
            #   Binding resource is associated with.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [BindingContext] BindingContext
            def initialize(version, chat_service_sid, sid)
              super(version)

              # Path Solution
              @solution = {chat_service_sid: chat_service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:chat_service_sid]}/Bindings/#{@solution[:sid]}"
            end

            ##
            # Delete the BindingInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
               @version.delete('DELETE', @uri)
            end

            ##
            # Fetch the BindingInstance
            # @return [BindingInstance] Fetched BindingInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              BindingInstance.new(
                  @version,
                  payload,
                  chat_service_sid: @solution[:chat_service_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.BindingContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.BindingContext #{context}>"
            end
          end

          class BindingInstance < InstanceResource
            ##
            # Initialize the BindingInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] chat_service_sid The SID of the {Conversation
            #   Service}[https://www.twilio.com/docs/conversations/api/service-resource] the
            #   Binding resource is associated with.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [BindingInstance] BindingInstance
            def initialize(version, payload, chat_service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'account_sid' => payload['account_sid'],
                  'chat_service_sid' => payload['chat_service_sid'],
                  'credential_sid' => payload['credential_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'endpoint' => payload['endpoint'],
                  'identity' => payload['identity'],
                  'binding_type' => payload['binding_type'],
                  'message_types' => payload['message_types'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'chat_service_sid' => chat_service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [BindingContext] BindingContext for this BindingInstance
            def context
              unless @instance_context
                @instance_context = BindingContext.new(@version, @params['chat_service_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] A 34 character string that uniquely identifies this resource.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The unique ID of the Account responsible for this binding.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The SID of the Conversation Service that the resource is associated with.
            def chat_service_sid
              @properties['chat_service_sid']
            end

            ##
            # @return [String] The SID of the Credential for the binding.
            def credential_sid
              @properties['credential_sid']
            end

            ##
            # @return [Time] The date that this resource was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date that this resource was last updated.
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The unique endpoint identifier for the Binding.
            def endpoint
              @properties['endpoint']
            end

            ##
            # @return [String] The identity of Conversation User associated with this binding.
            def identity
              @properties['identity']
            end

            ##
            # @return [binding.BindingType] The push technology to use for the binding.
            def binding_type
              @properties['binding_type']
            end

            ##
            # @return [String] The Conversation message types the binding is subscribed to.
            def message_types
              @properties['message_types']
            end

            ##
            # @return [String] An absolute URL for this binding.
            def url
              @properties['url']
            end

            ##
            # Delete the BindingInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Fetch the BindingInstance
            # @return [BindingInstance] Fetched BindingInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.BindingInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.BindingInstance #{values}>"
            end
          end
        end
      end
    end
  end
end