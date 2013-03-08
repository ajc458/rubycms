class CreateSections < ActiveRecord::Migration
  def up
    create_table :sections do |t|
      t.references :page
      t.string 'name'
      t.integer 'position'
      t.boolean 'visible', :default => false
      t.string 'content_type'
      t.text 'content'
      t.timestamps
    end
    
    add_index('sections', 'name')
    # add foreign key
    execute <<-SQL
      ALTER TABLE sections 
        ADD CONSTRAINT fk_sections_pages
        FOREIGN KEY (page_id)
        REFERENCES pages(id)
    SQL
  end
  
  def down
    drop_table :sections
  end
end