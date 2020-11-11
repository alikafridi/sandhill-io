class AddFieldToDomain < ActiveRecord::Migration[5.1]
  def change
    add_column :domains, :alexa_90day_delta, :integer
  end
end
