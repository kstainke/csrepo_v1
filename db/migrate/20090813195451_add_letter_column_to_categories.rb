class AddLetterColumnToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :letter, :string
  end

  def self.down
    remove_column :categories, :letter
  end
end
