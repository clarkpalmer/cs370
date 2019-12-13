class AddLastMeetingtoTutess < ActiveRecord::Migration[5.2]
  def change
    add_column :tutees, :last_meeting, :string, default: => {Date.today()}
  end
end
