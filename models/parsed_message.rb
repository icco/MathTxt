class ParsedMessage < CouchRest::Model::Base
  property :message, Message
  property :action, Action
  property :amount, Number
  property :list, MessageList
  timestamps!

  def ParsedMessage.parse msg
    pm = ParsedMessage.new
    pm.message = msg



    return true
  end
end
