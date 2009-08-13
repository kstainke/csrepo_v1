require 'active_record/fixtures'
class PopulateCoursesDb < ActiveRecord::Migration
  def self.up
    down
    directory = File.join(File.dirname(__FILE__), "data")
    Fixtures.create_fixtures(directory, "courses")
  end

  def self.down
    Course.delete_all
  end
end