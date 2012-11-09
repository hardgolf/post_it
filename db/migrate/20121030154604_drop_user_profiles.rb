class DropUserProfiles < ActiveRecord::Migration
  def up
    drop_table :user_profiles
  end

  def down
  end
end
