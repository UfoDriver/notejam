class CreatePads < ActiveRecord::Migration
  def change
    create_table :pads do |t|
      t.string :name
      t.references :user
    end
  end
end
