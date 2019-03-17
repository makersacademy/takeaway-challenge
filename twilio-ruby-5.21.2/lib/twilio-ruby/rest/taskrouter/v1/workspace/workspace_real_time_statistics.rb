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
          class WorkspaceRealTimeStatisticsList < ListResource
            ##
            # Initialize the WorkspaceRealTimeStatisticsList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @return [WorkspaceRealTimeStatisticsList] WorkspaceRealTimeStatisticsList
            def initialize(version, workspace_sid: nil)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid}
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.WorkspaceRealTimeStatisticsList>'
            end
          end

          class WorkspaceRealTimeStatisticsPage < Page
            ##
            # Initialize the WorkspaceRealTimeStatisticsPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [WorkspaceRealTimeStatisticsPage] WorkspaceRealTimeStatisticsPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of WorkspaceRealTimeStatisticsInstance
            # @param [Hash] payload Payload response from the API
            # @return [WorkspaceRealTimeStatisticsInstance] WorkspaceRealTimeStatisticsInstance
            def get_instance(payload)
              WorkspaceRealTimeStatisticsInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.WorkspaceRealTimeStatisticsPage>'
            end
          end

          class WorkspaceRealTimeStatisticsContext < InstanceContext
            ##
            # Initialize the WorkspaceRealTimeStatisticsContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @return [WorkspaceRealTimeStatisticsContext] WorkspaceRealTimeStatisticsContext
            def initialize(version, workspace_sid)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid, }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/RealTimeStatistics"
            end

            ##
            # Fetch a WorkspaceRealTimeStatisticsInstance
            # @param [String] task_channel Filter real-time and cumulative statistics by
            #   TaskChannel. Takes in a Unique Name ("voice", "sms", "default", etc.) or a
            #   TaskChannelSid.
            # @return [WorkspaceRealTimeStatisticsInstance] Fetched WorkspaceRealTimeStatisticsInstance
            def fetch(task_channel: :unset)
              params = Twilio::Values.of({'TaskChannel' => task_channel, })

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              WorkspaceRealTimeStatisticsInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.WorkspaceRealTimeStatisticsContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.WorkspaceRealTimeStatisticsContext #{context}>"
            end
          end

          class WorkspaceRealTimeStatisticsInstance < InstanceResource
            ##
            # Initialize the WorkspaceRealTimeStatisticsInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The workspace_sid
            # @return [WorkspaceRealTimeStatisticsInstance] WorkspaceRealTimeStatisticsInstance
            def initialize(version, payload, workspace_sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'activity_statistics' => payload['activity_statistics'],
                  'longest_task_waiting_age' => payload['longest_task_waiting_age'].to_i,
                  'longest_task_waiting_sid' => payload['longest_task_waiting_sid'],
                  'tasks_by_priority' => payload['tasks_by_priority'],
                  'tasks_by_status' => payload['tasks_by_status'],
                  'total_tasks' => payload['total_tasks'].to_i,
                  'total_workers' => payload['total_workers'].to_i,
                  'workspace_sid' => payload['workspace_sid'],
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'workspace_sid' => workspace_sid, }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [WorkspaceRealTimeStatisticsContext] WorkspaceRealTimeStatisticsContext for this WorkspaceRealTimeStatisticsInstance
            def context
              unless @instance_context
                @instance_context = WorkspaceRealTimeStatisticsContext.new(@version, @params['workspace_sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [Hash] A breakdown of Workers by Activity
            def activity_statistics
              @properties['activity_statistics']
            end

            ##
            # @return [String] The age of the longest waiting Task
            def longest_task_waiting_age
              @properties['longest_task_waiting_age']
            end

            ##
            # @return [String] The SID of the longest waiting Task
            def longest_task_waiting_sid
              @properties['longest_task_waiting_sid']
            end

            ##
            # @return [Hash] The tasks_by_priority
            def tasks_by_priority
              @properties['tasks_by_priority']
            end

            ##
            # @return [Hash] The Tasks broken down by status
            def tasks_by_status
              @properties['tasks_by_status']
            end

            ##
            # @return [String] The total number of Tasks
            def total_tasks
              @properties['total_tasks']
            end

            ##
            # @return [String] The total number of Workers in the workspace
            def total_workers
              @properties['total_workers']
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
            # Fetch a WorkspaceRealTimeStatisticsInstance
            # @param [String] task_channel Filter real-time and cumulative statistics by
            #   TaskChannel. Takes in a Unique Name ("voice", "sms", "default", etc.) or a
            #   TaskChannelSid.
            # @return [WorkspaceRealTimeStatisticsInstance] Fetched WorkspaceRealTimeStatisticsInstance
            def fetch(task_channel: :unset)
              context.fetch(task_channel: task_channel, )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.WorkspaceRealTimeStatisticsInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.WorkspaceRealTimeStatisticsInstance #{values}>"
            end
          end
        end
      end
    end
  end
end