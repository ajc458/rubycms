class CreateSubjects < ActiveRecord::Migration
  def up
    create_table :subjects do |t|
      t.string 'name'
      t.integer 'position'
      t.boolean 'visible'
      t.timestamps
    end
    
    add_index('subjects', 'name')
  end
  
  def down
    drop_table :subjects
  end
end