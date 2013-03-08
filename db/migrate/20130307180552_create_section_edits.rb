class CreateSectionEdits < ActiveRecord::Migration
  def up
    create_table :section_edits do |t|
      t.references :admin_user
      t.references :section
      t.string 'summary'
      t.timestamps
    end
    
    add_index :section_edits, ['admin_user_id', 'section_id']
    
    # add foreign key 1
    execute <<-SQL
      ALTER TABLE section_edits
        ADD CONSTRAINT fk_edits_users
        FOREIGN KEY (admin_user_id)
        REFERENCES admin_users(id)
    SQL
    
    # add foreign key 2
    execute <<-SQL
      ALTER TABLE section_edits
        ADD CONSTRAINT fk_edits_sections
        FOREIGN KEY (section_id)
        REFERENCES sections(id)
    SQL
    
  end
  
  def down
    drop_table :section_edits
  end
end
