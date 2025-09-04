class AddOrganizationIdToPosts < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :organization, foreign_key: true, null: false
  end
end
