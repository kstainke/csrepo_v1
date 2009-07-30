class CreateLabs < ActiveRecord::Migration
  def self.up
    create_table :labs do |t|
      t.string :filename
      t.string :content_type
      t.binary :data
      t.integer :tally
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :labs
  end
end
