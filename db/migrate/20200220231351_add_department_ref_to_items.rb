class AddDepartmentRefToItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :items, :department, null: false, foreign_key: true
  end
end
