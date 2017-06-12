require 'data_mapper'
require 'dm-postgres-adapter'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb-#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
