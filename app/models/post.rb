class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :scoped, scope: :organization

  belongs_to :organization

  def to_param
    id
  end

  # Override method added by FriendlyId::Scoped to prevent overwriting
  # explicitly set slugs.
  # https://github.com/norman/friendly_id/issues/983
  def should_generate_new_friendly_id?
    send(friendly_id_config.slug_column).nil? && super
  end
end
