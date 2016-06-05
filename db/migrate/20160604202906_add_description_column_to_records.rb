class AddDescriptionColumnToRecords < ActiveRecord::Migration
  def change
    add_column :records, :details, :text
  end
end
