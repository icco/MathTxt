class Message < CouchRest::Model::Base
  property :text, String
  property :from, String
  timestamps!

  ## The first method we call when we get a txt
  def Message.inc msg, from
    msg = Message.new
    msg.text = msg
    msg.from = from
    msg.save

  end
end
