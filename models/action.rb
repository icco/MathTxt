class Action < CouchRest::Model::Base
  property :action, String

  VALID = [ 'add', 'sub', 'remove' ]

  def run *opts
    ret = 0.0

    opts.each do |v|
      case self.action
      when 'add'
        ret = ret + v
      when 'sub'
      when 'remove'
        ret = ret - v
      end
    end

    return ret
  end

  def to_json
    return JSON.generate self
  end

  def to_s
    return self.action
  end

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
