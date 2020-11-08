##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Preview < Domain
      class Sync < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DocumentList < ListResource
            ##
            # Initialize the DocumentList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @return [DocumentList] DocumentList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Documents"
            end

            ##
            # Create the DocumentInstance
            # @param [String] unique_name The unique_name
            # @param [Hash] data The data
            # @return [DocumentInstance] Created DocumentInstance
            def create(unique_name: :unset, data: :unset)
              data = Twilio::Values.of({'UniqueName' => unique_name, 'Data' => Twilio.serialize_object(data), })

              payload = @version.create('POST', @uri, data: data)

              DocumentInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Lists DocumentInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams DocumentInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields DocumentInstance records from the API.
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
            # Retrieve a single page of DocumentInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of DocumentInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })

              response = @version.page('GET', @uri, params: params)

              DocumentPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of DocumentInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of DocumentInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              DocumentPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Preview.Sync.DocumentList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DocumentPage < Page
            ##
            # Initialize the DocumentPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [DocumentPage] DocumentPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of DocumentInstance
            # @param [Hash] payload Payload response from the API
            # @return [DocumentInstance] DocumentInstance
            def get_instance(payload)
              DocumentInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Preview.Sync.DocumentPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DocumentContext < InstanceContext
            ##
            # Initialize the DocumentContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [DocumentContext] DocumentContext
            def initialize(version, service_sid, sid)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, sid: sid, }
              @uri = "/Services/#{@solution[:service_sid]}/Documents/#{@solution[:sid]}"

              # Dependents
              @document_permissions = nil
            end

            ##
            # Fetch the DocumentInstance
            # @return [DocumentInstance] Fetched DocumentInstance
            def fetch
              payload = @version.fetch('GET', @uri)

              DocumentInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Delete the DocumentInstance
            # @param [String] if_match The If-Match HTTP request header
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete(if_match: :unset)
              headers = Twilio::Values.of({'If-Match' => if_match, })

               @version.delete('DELETE', @uri, headers: headers)
            end

            ##
            # Update the DocumentInstance
            # @param [Hash] data The data
            # @param [String] if_match The If-Match HTTP request header
            # @return [DocumentInstance] Updated DocumentInstance
            def update(data: nil, if_match: :unset)
              data = Twilio::Values.of({'Data' => Twilio.serialize_object(data), })
              headers = Twilio::Values.of({'If-Match' => if_match, })

              payload = @version.update('POST', @uri, data: data, headers: headers)

              DocumentInstance.new(@version, payload, service_sid: @solution[:service_sid], sid: @solution[:sid], )
            end

            ##
            # Access the document_permissions
            # @return [DocumentPermissionList]
            # @return [DocumentPermissionContext] if identity was passed.
            def document_permissions(identity=:unset)
              raise ArgumentError, 'identity cannot be nil' if identity.nil?

              if identity != :unset
                return DocumentPermissionContext.new(@version, @solution[:service_sid], @solution[:sid], identity, )
              end

              unless @document_permissions
                @document_permissions = DocumentPermissionList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    document_sid: @solution[:sid],
                )
              end

              @document_permissions
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Sync.DocumentContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Preview.Sync.DocumentContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class DocumentInstance < InstanceResource
            ##
            # Initialize the DocumentInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The service_sid
            # @param [String] sid The sid
            # @return [DocumentInstance] DocumentInstance
            def initialize(version, payload, service_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'unique_name' => payload['unique_name'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'url' => payload['url'],
                  'links' => payload['links'],
                  'revision' => payload['revision'],
                  'data' => payload['data'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'created_by' => payload['created_by'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [DocumentContext] DocumentContext for this DocumentInstance
            def context
              unless @instance_context
                @instance_context = DocumentContext.new(@version, @params['service_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The sid
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The unique_name
            def unique_name
              @properties['unique_name']
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The service_sid
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [String] The links
            def links
              @properties['links']
            end

            ##
            # @return [String] The revision
            def revision
              @properties['revision']
            end

            ##
            # @return [Hash] The data
            def data
              @properties['data']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date_updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The created_by
            def created_by
              @properties['created_by']
            end

            ##
            # Fetch the DocumentInstance
            # @return [DocumentInstance] Fetched DocumentInstance
            def fetch
              context.fetch
            end

            ##
            # Delete the DocumentInstance
            # @param [String] if_match The If-Match HTTP request header
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete(if_match: :unset)
              context.delete(if_match: if_match, )
            end

            ##
            # Update the DocumentInstance
            # @param [Hash] data The data
            # @param [String] if_match The If-Match HTTP request header
            # @return [DocumentInstance] Updated DocumentInstance
            def update(data: nil, if_match: :unset)
              context.update(data: data, if_match: if_match, )
            end

            ##
            # Access the document_permissions
            # @return [document_permissions] document_permissions
            def document_permissions
              context.document_permissions
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Sync.DocumentInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Preview.Sync.DocumentInstance #{values}>"
            end
          end
        end
      end
    end
  end
end