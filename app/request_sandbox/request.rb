class Request < ActiveRecord::Base

  def to_hash
    {
      :id => id,
      :key => key,
      :info => info,
      :created_at => created_at
    }
  end
end