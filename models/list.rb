class List < CouchRest::Model::Base
  property :total, Float
  collection_of :parsed_messages
  property :name, String
  property :creator, String

  design do
    view :by_name_and_creator
  end

  def initialize
    @total = 0
  end

  def update
    self.parsed_messages.each do |pm|
      self.total = pm.act self.total
    end

    self.save
  end

  def to_json
    return JSON.generate self
  end

  def self.find phone, name
    list_query = List.by_name_and_creator({:name => name, :creator => phone})
    list = list_query.first

    if list.nil?
      list = List.new
      list.name = name
      list.creator = phone
      list.save
    end

    return list
  end
end
