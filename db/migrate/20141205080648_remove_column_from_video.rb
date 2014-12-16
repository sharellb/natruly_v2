class RemoveColumnFromVideo < ActiveRecord::Migration
  def change
  	remove_column :videos, :duration
  	remove_column :videos, :likes
  	remove_column :videos, :dislikes
  end
end
