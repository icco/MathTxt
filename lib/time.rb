class Time
  def time_since
    dist = Time.now - self
    distance = dist.abs
    post_sentence = dist < 0 ? "" : " ago"

    out = case distance
          when 0 .. 59 then "#{distance} seconds"
          when 60 .. (60*60) then "#{distance/60} minutes"
          when (60*60) .. (60*60*24) then "#{distance/(60*60)} hours"
          when (60*60*24) .. (60*60*24*30) then "#{distance/((60*60)*24)} days"
          else self.to_s
          end

    return out.sub(/^1 (\w+)s ago$/, 'one \1 ago')
  end
end
