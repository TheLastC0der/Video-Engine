# Initialize pubnub client with our keys

require 'pubnub'

$pubnub = Pubnub.new(
    subscribe_key: 'sub-c-56b97168-e529-11e7-a7db-e6c6e9cd0a3f',
    publish_key: 'pub-c-15ad5b3e-1994-47e9-b615-7a6bcb1162cb',
    secret_key: 'sec-c-YjhlYzM5Y2UtYzVhZC00M2Y2LTkzYTgtOGVjZTJkMGVkZjBh',
)

# As we have PAM enabled, we have to grant access to channels.
# That grants read right to any channel that begins with 'video.' to everyone.
$pubnub.grant(
    read: true,
    write: false,
    auth_key: nil,
    channel: 'video.*',
    http_sync: true,
    ttl: 0
)

# That grants read and write right to any channel that begins with 'video.' to this client.
$pubnub.grant(
    read: true,
    write: true,
    auth_key: Rails.application.secrets.pubnub_auth_key,
    channel: 'video.*',
    http_sync: true,
    ttl: 0
)

# That grants read and write right to any channel that begins with 'notifications.' to this client.
$pubnub.grant(
    read: true,
    write: true,
    auth_key: Rails.application.secrets.pubnub_auth_key,
    channel: 'notifications.*',
    http_sync: true,
    ttl: 0
)
