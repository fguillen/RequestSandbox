class Request < ActiveRecord::Base
  serialize :info, JSON

  validates :info, :presence => true

  def to_hash
    {
      :id => id,
      :key => key,
      :info => info,
      :created_at => created_at.strftime("%F %T")
    }
  end
end