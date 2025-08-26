class Avo::Actions::CountQuery < Avo::BaseAction
  self.name = "Count Query"
  # self.visible = -> do
  #   true
  # end

  # def fields
  #   # Add Action fields here
  # end

  def handle(query:, fields:, current_user:, resource:, **args)
    if query.count.zero?
      Rails.logger.error "No records found for #{query.model_name.name} query -> #{query.to_sql}"
      error "No records found"
    else
      succeed "Found #{query.count} records"
    end
  end
end
