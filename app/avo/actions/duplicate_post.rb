class Avo::Actions::DuplicatePost < Avo::Actions::DuplicateBase
  self.name = "Duplicate Post"

  def fields
    field :organization, as: :belongs_to
    field :title, as: :text
  end
end
