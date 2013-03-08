class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.references :subject
      t.string 'name'
      t.string 'permalink'
      t.integer 'position'
      t.boolean 'visible', :default => false
      t.timestamps
    end
    
    add_index('pages', 'permalink')
    
    # add foreign key
    execute <<-SQL
      ALTER TABLE pages
        ADD CONSTRAINT fk_pages_subjects
        FOREIGN KEY (subject_id)
        REFERENCES subjects(id)
    SQL
  end
  
  def down
    drop_table :pages
  end
end