class AddColumnBandId < ActiveRecord::Migration
  def change
    add_column(:albums, :band_id, :integer, null: false)
  end
end
