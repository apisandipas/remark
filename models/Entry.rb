class Entry
  include DataMapper::Resource

  property :id, Serial
  property :title, String, default: 'default-title'
  property :body, Text, default: 'default-body'

  attr_accessor :id, :title, :body
end