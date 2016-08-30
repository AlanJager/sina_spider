# encoding=utf-8
require 'mongo'

class MongoDBPipeline
  attr_reader :client

  def initialize
    @client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'sina')
    @db = client.database
  end
end