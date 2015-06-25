class CreateVisitorLogs < ActiveRecord::Migration
  def change
    create_table :visitor_logs do |t|
      t.integer :user_id
      t.string :reason
      t.string :student_name
      t.datetime :time_in
      t.datetime :time_out

      t.timestamps null: false
    end
  end
end
