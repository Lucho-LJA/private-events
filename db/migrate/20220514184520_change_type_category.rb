class ChangeTypeCategory < ActiveRecord::Migration[7.0]
  def up
    change_table :events do |t|
      t.change :event_date, :datetime
    end
  end

  def down
    change_table :events do |t|
      t.change :event_date, :datetime
    end
  end
end
