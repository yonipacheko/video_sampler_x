class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :title
      t.text :description
      t.string :thumb_url
      t.string :large_url
      t.string :start_point
      t.timestamp :start_time
      t.string :end_point
      t.timestamp :end_time

      t.timestamps
    end
  end
end
