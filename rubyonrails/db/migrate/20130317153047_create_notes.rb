class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name, :null => false
      t.text :text, :null => false
      t.references :pad
      t.references :user
      t.timestamps
    end
  end
end
