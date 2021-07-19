class AddIndexToEventUid < ActiveRecord::Migration[5.2]
  def change
    add_index :events, :uid, unique: true
  end
end
