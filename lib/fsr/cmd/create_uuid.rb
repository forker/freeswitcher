require "fsr/app"
module FSR
  module Cmd
    class CreateUuid < Command

      def initialize(fs_socket = nil)
        @fs_socket = fs_socket # FSR::CommandSocket obj
      end

      # Send the command to the event socket, using bgapi by default.
      def run()
        command = "%s %s" % [:api, raw]
        Log.debug "saying #{command}"
        @fs_socket.say(command)
      end

      # This method builds the API command to send to the freeswitch event socket
      def raw
        command = "create_uuid"
      end
    end

    register(:create_uuid, CreateUuid)
  end
end
