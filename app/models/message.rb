require 'data_mapper'
require 'dm-postgres-adapter'

class Message
  include DataMapper::Resource

  property :id, Serial
  property :text, String
  property :sender_id, String
  property :receiver_id, String

end
