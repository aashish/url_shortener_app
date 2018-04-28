class CreateStatistics < ActiveRecord::Migration[5.1]
  def change
    create_table :statistics do |t|
      t.integer :link_id
      t.string :ip
      t.string :latitude
      t.string :longitude
      t.datetime :requested_at
      t.string :request_from

      t.timestamps
    end
  end
end
