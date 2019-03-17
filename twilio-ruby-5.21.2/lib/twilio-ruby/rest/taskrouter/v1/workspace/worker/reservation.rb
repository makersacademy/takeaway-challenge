##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class WorkerContext < InstanceContext
            class ReservationList < ListResource
              ##
              # Initialize the ReservationList
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] worker_sid The worker_sid
              # @return [ReservationList] ReservationList
              def initialize(version, workspace_sid: nil, worker_sid: nil)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, worker_sid: worker_sid}
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:worker_sid]}/Reservations"
              end

              ##
              # Lists ReservationInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [reservation.Status] reservation_status Filter by a worker's reservation
              #   status (pending, accepted, rejected, timeout, canceled, rescinded)
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(reservation_status: :unset, limit: nil, page_size: nil)
                self.stream(reservation_status: reservation_status, limit: limit, page_size: page_size).entries
              end

              ##
              # Streams ReservationInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [reservation.Status] reservation_status Filter by a worker's reservation
              #   status (pending, accepted, rejected, timeout, canceled, rescinded)
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(reservation_status: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(reservation_status: reservation_status, page_size: limits[:page_size], )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields ReservationInstance records from the API.
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
              # Retrieve a single page of ReservationInstance records from the API.
              # Request is executed immediately.
              # @param [reservation.Status] reservation_status Filter by a worker's reservation
              #   status (pending, accepted, rejected, timeout, canceled, rescinded)
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of ReservationInstance
              def page(reservation_status: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'ReservationStatus' => reservation_status,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                ReservationPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of ReservationInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of ReservationInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                ReservationPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Taskrouter.V1.ReservationList>'
              end
            end

            class ReservationPage < Page
              ##
              # Initialize the ReservationPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [ReservationPage] ReservationPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of ReservationInstance
              # @param [Hash] payload Payload response from the API
              # @return [ReservationInstance] ReservationInstance
              def get_instance(payload)
                ReservationInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    worker_sid: @solution[:worker_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Taskrouter.V1.ReservationPage>'
              end
            end

            class ReservationContext < InstanceContext
              ##
              # Initialize the ReservationContext
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] worker_sid The worker_sid
              # @param [String] sid The sid
              # @return [ReservationContext] ReservationContext
              def initialize(version, workspace_sid, worker_sid, sid)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, worker_sid: worker_sid, sid: sid, }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:worker_sid]}/Reservations/#{@solution[:sid]}"
              end

              ##
              # Fetch a ReservationInstance
              # @return [ReservationInstance] Fetched ReservationInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                ReservationInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    worker_sid: @solution[:worker_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Update the ReservationInstance
              # @param [reservation.Status] reservation_status Yes
              # @param [String] worker_activity_sid No
              # @param [String] instruction Yes
              # @param [String] dequeue_post_work_activity_sid No
              # @param [String] dequeue_from Yes
              # @param [String] dequeue_record The dequeue_record
              # @param [String] dequeue_timeout The dequeue_timeout
              # @param [String] dequeue_to The dequeue_to
              # @param [String] dequeue_status_callback_url The dequeue_status_callback_url
              # @param [String] call_from Yes
              # @param [String] call_record The call_record
              # @param [String] call_timeout The call_timeout
              # @param [String] call_to The call_to
              # @param [String] call_url Yes
              # @param [String] call_status_callback_url No
              # @param [Boolean] call_accept No
              # @param [String] redirect_call_sid The redirect_call_sid
              # @param [Boolean] redirect_accept The redirect_accept
              # @param [String] redirect_url The redirect_url
              # @param [String] to The to
              # @param [String] from The from
              # @param [String] status_callback The status_callback
              # @param [String] status_callback_method The status_callback_method
              # @param [reservation.CallStatus] status_callback_event The status_callback_event
              # @param [String] timeout The timeout
              # @param [Boolean] record The record
              # @param [Boolean] muted The muted
              # @param [String] beep The beep
              # @param [Boolean] start_conference_on_enter The start_conference_on_enter
              # @param [Boolean] end_conference_on_exit The end_conference_on_exit
              # @param [String] wait_url The wait_url
              # @param [String] wait_method The wait_method
              # @param [Boolean] early_media The early_media
              # @param [String] max_participants The max_participants
              # @param [String] conference_status_callback The conference_status_callback
              # @param [String] conference_status_callback_method The
              #   conference_status_callback_method
              # @param [reservation.ConferenceEvent] conference_status_callback_event The
              #   conference_status_callback_event
              # @param [String] conference_record The conference_record
              # @param [String] conference_trim The conference_trim
              # @param [String] recording_channels The recording_channels
              # @param [String] recording_status_callback The recording_status_callback
              # @param [String] recording_status_callback_method The
              #   recording_status_callback_method
              # @param [String] conference_recording_status_callback The
              #   conference_recording_status_callback
              # @param [String] conference_recording_status_callback_method The
              #   conference_recording_status_callback_method
              # @param [String] region The region
              # @param [String] sip_auth_username The sip_auth_username
              # @param [String] sip_auth_password The sip_auth_password
              # @param [String] dequeue_status_callback_event The dequeue_status_callback_event
              # @param [String] post_work_activity_sid The post_work_activity_sid
              # @param [Boolean] end_conference_on_customer_exit The
              #   end_conference_on_customer_exit
              # @param [Boolean] beep_on_customer_entrance The beep_on_customer_entrance
              # @return [ReservationInstance] Updated ReservationInstance
              def update(reservation_status: :unset, worker_activity_sid: :unset, instruction: :unset, dequeue_post_work_activity_sid: :unset, dequeue_from: :unset, dequeue_record: :unset, dequeue_timeout: :unset, dequeue_to: :unset, dequeue_status_callback_url: :unset, call_from: :unset, call_record: :unset, call_timeout: :unset, call_to: :unset, call_url: :unset, call_status_callback_url: :unset, call_accept: :unset, redirect_call_sid: :unset, redirect_accept: :unset, redirect_url: :unset, to: :unset, from: :unset, status_callback: :unset, status_callback_method: :unset, status_callback_event: :unset, timeout: :unset, record: :unset, muted: :unset, beep: :unset, start_conference_on_enter: :unset, end_conference_on_exit: :unset, wait_url: :unset, wait_method: :unset, early_media: :unset, max_participants: :unset, conference_status_callback: :unset, conference_status_callback_method: :unset, conference_status_callback_event: :unset, conference_record: :unset, conference_trim: :unset, recording_channels: :unset, recording_status_callback: :unset, recording_status_callback_method: :unset, conference_recording_status_callback: :unset, conference_recording_status_callback_method: :unset, region: :unset, sip_auth_username: :unset, sip_auth_password: :unset, dequeue_status_callback_event: :unset, post_work_activity_sid: :unset, end_conference_on_customer_exit: :unset, beep_on_customer_entrance: :unset)
                data = Twilio::Values.of({
                    'ReservationStatus' => reservation_status,
                    'WorkerActivitySid' => worker_activity_sid,
                    'Instruction' => instruction,
                    'DequeuePostWorkActivitySid' => dequeue_post_work_activity_sid,
                    'DequeueFrom' => dequeue_from,
                    'DequeueRecord' => dequeue_record,
                    'DequeueTimeout' => dequeue_timeout,
                    'DequeueTo' => dequeue_to,
                    'DequeueStatusCallbackUrl' => dequeue_status_callback_url,
                    'CallFrom' => call_from,
                    'CallRecord' => call_record,
                    'CallTimeout' => call_timeout,
                    'CallTo' => call_to,
                    'CallUrl' => call_url,
                    'CallStatusCallbackUrl' => call_status_callback_url,
                    'CallAccept' => call_accept,
                    'RedirectCallSid' => redirect_call_sid,
                    'RedirectAccept' => redirect_accept,
                    'RedirectUrl' => redirect_url,
                    'To' => to,
                    'From' => from,
                    'StatusCallback' => status_callback,
                    'StatusCallbackMethod' => status_callback_method,
                    'StatusCallbackEvent' => Twilio.serialize_list(status_callback_event) { |e| e },
                    'Timeout' => timeout,
                    'Record' => record,
                    'Muted' => muted,
                    'Beep' => beep,
                    'StartConferenceOnEnter' => start_conference_on_enter,
                    'EndConferenceOnExit' => end_conference_on_exit,
                    'WaitUrl' => wait_url,
                    'WaitMethod' => wait_method,
                    'EarlyMedia' => early_media,
                    'MaxParticipants' => max_participants,
                    'ConferenceStatusCallback' => conference_status_callback,
                    'ConferenceStatusCallbackMethod' => conference_status_callback_method,
                    'ConferenceStatusCallbackEvent' => Twilio.serialize_list(conference_status_callback_event) { |e| e },
                    'ConferenceRecord' => conference_record,
                    'ConferenceTrim' => conference_trim,
                    'RecordingChannels' => recording_channels,
                    'RecordingStatusCallback' => recording_status_callback,
                    'RecordingStatusCallbackMethod' => recording_status_callback_method,
                    'ConferenceRecordingStatusCallback' => conference_recording_status_callback,
                    'ConferenceRecordingStatusCallbackMethod' => conference_recording_status_callback_method,
                    'Region' => region,
                    'SipAuthUsername' => sip_auth_username,
                    'SipAuthPassword' => sip_auth_password,
                    'DequeueStatusCallbackEvent' => Twilio.serialize_list(dequeue_status_callback_event) { |e| e },
                    'PostWorkActivitySid' => post_work_activity_sid,
                    'EndConferenceOnCustomerExit' => end_conference_on_customer_exit,
                    'BeepOnCustomerEntrance' => beep_on_customer_entrance,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                ReservationInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    worker_sid: @solution[:worker_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.ReservationContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.ReservationContext #{context}>"
              end
            end

            class ReservationInstance < InstanceResource
              ##
              # Initialize the ReservationInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] workspace_sid The workspace_sid
              # @param [String] worker_sid The worker_sid
              # @param [String] sid The sid
              # @return [ReservationInstance] ReservationInstance
              def initialize(version, payload, workspace_sid: nil, worker_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                    'reservation_status' => payload['reservation_status'],
                    'sid' => payload['sid'],
                    'task_sid' => payload['task_sid'],
                    'worker_name' => payload['worker_name'],
                    'worker_sid' => payload['worker_sid'],
                    'workspace_sid' => payload['workspace_sid'],
                    'url' => payload['url'],
                    'links' => payload['links'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'workspace_sid' => workspace_sid,
                    'worker_sid' => worker_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [ReservationContext] ReservationContext for this ReservationInstance
              def context
                unless @instance_context
                  @instance_context = ReservationContext.new(
                      @version,
                      @params['workspace_sid'],
                      @params['worker_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The account_sid
              def account_sid
                @properties['account_sid']
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
              # @return [reservation.Status] Filter by a worker's reservation status
              def reservation_status
                @properties['reservation_status']
              end

              ##
              # @return [String] The sid
              def sid
                @properties['sid']
              end

              ##
              # @return [String] The task_sid
              def task_sid
                @properties['task_sid']
              end

              ##
              # @return [String] The worker_name
              def worker_name
                @properties['worker_name']
              end

              ##
              # @return [String] The worker_sid
              def worker_sid
                @properties['worker_sid']
              end

              ##
              # @return [String] The workspace_sid
              def workspace_sid
                @properties['workspace_sid']
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
              # Fetch a ReservationInstance
              # @return [ReservationInstance] Fetched ReservationInstance
              def fetch
                context.fetch
              end

              ##
              # Update the ReservationInstance
              # @param [reservation.Status] reservation_status Yes
              # @param [String] worker_activity_sid No
              # @param [String] instruction Yes
              # @param [String] dequeue_post_work_activity_sid No
              # @param [String] dequeue_from Yes
              # @param [String] dequeue_record The dequeue_record
              # @param [String] dequeue_timeout The dequeue_timeout
              # @param [String] dequeue_to The dequeue_to
              # @param [String] dequeue_status_callback_url The dequeue_status_callback_url
              # @param [String] call_from Yes
              # @param [String] call_record The call_record
              # @param [String] call_timeout The call_timeout
              # @param [String] call_to The call_to
              # @param [String] call_url Yes
              # @param [String] call_status_callback_url No
              # @param [Boolean] call_accept No
              # @param [String] redirect_call_sid The redirect_call_sid
              # @param [Boolean] redirect_accept The redirect_accept
              # @param [String] redirect_url The redirect_url
              # @param [String] to The to
              # @param [String] from The from
              # @param [String] status_callback The status_callback
              # @param [String] status_callback_method The status_callback_method
              # @param [reservation.CallStatus] status_callback_event The status_callback_event
              # @param [String] timeout The timeout
              # @param [Boolean] record The record
              # @param [Boolean] muted The muted
              # @param [String] beep The beep
              # @param [Boolean] start_conference_on_enter The start_conference_on_enter
              # @param [Boolean] end_conference_on_exit The end_conference_on_exit
              # @param [String] wait_url The wait_url
              # @param [String] wait_method The wait_method
              # @param [Boolean] early_media The early_media
              # @param [String] max_participants The max_participants
              # @param [String] conference_status_callback The conference_status_callback
              # @param [String] conference_status_callback_method The
              #   conference_status_callback_method
              # @param [reservation.ConferenceEvent] conference_status_callback_event The
              #   conference_status_callback_event
              # @param [String] conference_record The conference_record
              # @param [String] conference_trim The conference_trim
              # @param [String] recording_channels The recording_channels
              # @param [String] recording_status_callback The recording_status_callback
              # @param [String] recording_status_callback_method The
              #   recording_status_callback_method
              # @param [String] conference_recording_status_callback The
              #   conference_recording_status_callback
              # @param [String] conference_recording_status_callback_method The
              #   conference_recording_status_callback_method
              # @param [String] region The region
              # @param [String] sip_auth_username The sip_auth_username
              # @param [String] sip_auth_password The sip_auth_password
              # @param [String] dequeue_status_callback_event The dequeue_status_callback_event
              # @param [String] post_work_activity_sid The post_work_activity_sid
              # @param [Boolean] end_conference_on_customer_exit The
              #   end_conference_on_customer_exit
              # @param [Boolean] beep_on_customer_entrance The beep_on_customer_entrance
              # @return [ReservationInstance] Updated ReservationInstance
              def update(reservation_status: :unset, worker_activity_sid: :unset, instruction: :unset, dequeue_post_work_activity_sid: :unset, dequeue_from: :unset, dequeue_record: :unset, dequeue_timeout: :unset, dequeue_to: :unset, dequeue_status_callback_url: :unset, call_from: :unset, call_record: :unset, call_timeout: :unset, call_to: :unset, call_url: :unset, call_status_callback_url: :unset, call_accept: :unset, redirect_call_sid: :unset, redirect_accept: :unset, redirect_url: :unset, to: :unset, from: :unset, status_callback: :unset, status_callback_method: :unset, status_callback_event: :unset, timeout: :unset, record: :unset, muted: :unset, beep: :unset, start_conference_on_enter: :unset, end_conference_on_exit: :unset, wait_url: :unset, wait_method: :unset, early_media: :unset, max_participants: :unset, conference_status_callback: :unset, conference_status_callback_method: :unset, conference_status_callback_event: :unset, conference_record: :unset, conference_trim: :unset, recording_channels: :unset, recording_status_callback: :unset, recording_status_callback_method: :unset, conference_recording_status_callback: :unset, conference_recording_status_callback_method: :unset, region: :unset, sip_auth_username: :unset, sip_auth_password: :unset, dequeue_status_callback_event: :unset, post_work_activity_sid: :unset, end_conference_on_customer_exit: :unset, beep_on_customer_entrance: :unset)
                context.update(
                    reservation_status: reservation_status,
                    worker_activity_sid: worker_activity_sid,
                    instruction: instruction,
                    dequeue_post_work_activity_sid: dequeue_post_work_activity_sid,
                    dequeue_from: dequeue_from,
                    dequeue_record: dequeue_record,
                    dequeue_timeout: dequeue_timeout,
                    dequeue_to: dequeue_to,
                    dequeue_status_callback_url: dequeue_status_callback_url,
                    call_from: call_from,
                    call_record: call_record,
                    call_timeout: call_timeout,
                    call_to: call_to,
                    call_url: call_url,
                    call_status_callback_url: call_status_callback_url,
                    call_accept: call_accept,
                    redirect_call_sid: redirect_call_sid,
                    redirect_accept: redirect_accept,
                    redirect_url: redirect_url,
                    to: to,
                    from: from,
                    status_callback: status_callback,
                    status_callback_method: status_callback_method,
                    status_callback_event: status_callback_event,
                    timeout: timeout,
                    record: record,
                    muted: muted,
                    beep: beep,
                    start_conference_on_enter: start_conference_on_enter,
                    end_conference_on_exit: end_conference_on_exit,
                    wait_url: wait_url,
                    wait_method: wait_method,
                    early_media: early_media,
                    max_participants: max_participants,
                    conference_status_callback: conference_status_callback,
                    conference_status_callback_method: conference_status_callback_method,
                    conference_status_callback_event: conference_status_callback_event,
                    conference_record: conference_record,
                    conference_trim: conference_trim,
                    recording_channels: recording_channels,
                    recording_status_callback: recording_status_callback,
                    recording_status_callback_method: recording_status_callback_method,
                    conference_recording_status_callback: conference_recording_status_callback,
                    conference_recording_status_callback_method: conference_recording_status_callback_method,
                    region: region,
                    sip_auth_username: sip_auth_username,
                    sip_auth_password: sip_auth_password,
                    dequeue_status_callback_event: dequeue_status_callback_event,
                    post_work_activity_sid: post_work_activity_sid,
                    end_conference_on_customer_exit: end_conference_on_customer_exit,
                    beep_on_customer_entrance: beep_on_customer_entrance,
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.ReservationInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.ReservationInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end