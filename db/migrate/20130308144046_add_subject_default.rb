class AddSubjectDefault < ActiveRecord::Migration
  def up
    change_column('subjects', 'visible', :boolean, :default => 0)
  end

  def down
    change_column('subjects', 'visible', :boolean, :default => '')
  end
end
