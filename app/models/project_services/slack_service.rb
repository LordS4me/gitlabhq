class SlackService < ChatNotificationService
  def title
    'Slack notifications'
  end

  def description
    'Receive event notifications in Slack'
  end

  def self.to_param
    'slack'
  end

  def help
    'This service sends notifications about projects events to Slack channels.<br />
    To set up this service:
    <ol>
      <li><a href="https://slack.com/apps/A0F7XDUAZ-incoming-webhooks">Add an incoming webhook</a> in your Slack team. The default channel can be overridden for each event.</li>
      <li>Paste the <strong>Webhook URL</strong> into the field below.</li>
      <li>Select events below to enable notifications. The <strong>Channel name</strong> and <strong>Username</strong> fields are optional.</li>
    </ol>'
  end

  def fields
    default_fields + build_event_channels
  end

  def default_fields
    [
      { type: 'text', name: 'webhook', placeholder: 'e.g. https://hooks.slack.com/services/…' },
      { type: 'text', name: 'username', placeholder: 'e.g. GitLab' },
      { type: 'checkbox', name: 'notify_only_broken_pipelines' },
    ]
  end

  def default_channel_placeholder
    "Channel name (e.g. general)"
  end
end
