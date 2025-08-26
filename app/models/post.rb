class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  def to_param
    id
  end
end
