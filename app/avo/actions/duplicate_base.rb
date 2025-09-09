class Avo::Actions::DuplicateBase < Avo::BaseAction
  self.name = "Duplicate"
  self.visible = -> do
    view == :show
  end

  def handle(query:, fields:, **args)
    query.each do |record|
      ActiveRecord::Base.transaction do
        new_record = record.dup

        if fields.present?
          new_record.assign_attributes(fields)
        end

        if new_record.save
          redirect_to view_context.resource_path(record: new_record, resource:)
        else
          error new_record.errors.full_messages.to_sentence
        end
      end
    end
  end
end
