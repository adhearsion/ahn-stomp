require "ahn-stomp/version"
require "stomp"

class StompGateway < Adhearsion::Plugin
  # TODO: Recover from a disconnect!

  def self.connection
    @@connection
  end

  init :stomp_gateway do
    user = ""
    pass = ""
    host = "localhost"
    port = 61613

    @@connection = Stomp::Client.open user, pass, host, port

    subscriptions = [:start_call, :hungup_call]

    logger.info "Connection established. Subscriptions: #{subscriptions.inspect}"

    subscriptions.each do |subscription|
      StompGateway.connection.subscribe subscription.to_s do |event|
        Adhearsion::Events.trigger :"stomp_subscription", event
      end
    end

  end

end

class Object
  def send_stomp(destination, message, headers = {})
    StompGateway.connection.send destination, message, headers
  end
end
