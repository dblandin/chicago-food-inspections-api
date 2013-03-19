class AddInspections < ActiveRecord::Migration
  def up
    create_table :inspections do |t|
      t.string :inspection_id
      t.datetime :inspection_date
      t.string :facility_type
      t.string :license
      t.string :address
      t.string :city
      t.string :zip
      t.string :state
      t.string :dba_name
      t.string :aka_name
      t.string :result
      t.string :risk
      t.text :violations
    end
  end

  def down
    drop_table :inspections
  end
end
