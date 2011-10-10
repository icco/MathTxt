class ParsedMessage < CouchRest::Model::Base
  property :action, Action
  property :amount, Number
  property :list, List
  timestamps!
end
