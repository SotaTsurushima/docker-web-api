class SlackNotifier
  attr_reader :client

  def initialize
    @client = Slack::Notifier.new(webhook_url, channel: CHANNEL, username: USER_NAME)
  end

  def send(message)
    Slack::Notifier.new(WEBHOOK_URL, channel: CHANNEL, username: USER_NAME).ping(message)
  end
end