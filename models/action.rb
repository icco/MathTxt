class Action < CouchRest::Model::Base
  property :action, String

  VALID = [ 'add', 'sub' ]

  def Action.create str
    ac = nil

    if Action.valid? str
      ac = Action.new
      ac.action = str
      ac.save
    end

    return ac
  end

  def Action.valid? str
    return Action.strings.include? str
  end

  def Action.strings
    return VALID
  end
end
