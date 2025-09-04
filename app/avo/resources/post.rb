class Avo::Resources::Post < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id, link_to_record: true
    field :title, as: :text
    field :slug, as: :text, only_on: :show
    field :organization, as: :belongs_to
  end

  def actions
    action Avo::Actions::CountQuery
  end
end
