class List < CouchRest::Model::Base
  property :total, Float
  collection_of :parsed_messages
  property :name, String
  property :creator, String

  design do
    view :by_name_and_creator
  end

  def to_json
    return JSON.generate self
  end

  def List.find phone, name
    list_query = List.by_name_and_creator({:name => name, :creator => phone})
    list = list_query.first

    p list

    if list.nil?
      list = List.new
      list.total = 0
      list.name = name
      list.creator = phone
      list.save
    end

    return list
  end
end
