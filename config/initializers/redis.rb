require 'redis'

redis_config = Rails.application.config_for(:redis)

$redis = Redis.new(host: redis_config['host'], port: redis_config['port'])