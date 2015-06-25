class AddUserRefToVisitorLogs < ActiveRecord::Migration
  def change
    add_reference :visitor_logs, :user, index: true
    add_foreign_key :visitor_logs, :users
  end
end
