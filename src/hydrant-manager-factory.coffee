redis          = require 'redis'
RedisNS        = require '@octoblu/redis-ns'
HydrantManager = require '..'

class HydrantManagerFactory
  constructor: ({@uuidAliasResolver, @namespace, @redisUri}) ->
    throw new Error('HydrantManagerFactory: redisUri is required') unless @redisUri?
    throw new Error('HydrantManagerFactory: namespace is required') unless @namespace?
    throw new Error('HydrantManagerFactory: uuidAliasResolver is required') unless @uuidAliasResolver?

  build: =>
    client = new RedisNS @namespace, redis.createClient(@redisUri)
    new HydrantManager {client, @uuidAliasResolver}

module.exports = HydrantManagerFactory
