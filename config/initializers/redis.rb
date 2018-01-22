unless Rails.env.test?
  $REDIS = Redis::Namespace.new('heft',
                               redis: Redis.new(host: Rails.application.config.redis_host, port: 6379, db: 0))
else
  $REDIS = Redis::Namespace.new('heft', redis: MockRedis.new)
end
# $redis = Redis::Namespace.new('recommendation_api', redis: Redis.new)
