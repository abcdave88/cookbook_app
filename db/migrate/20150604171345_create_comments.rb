class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :posted_by
      t.text :opinion

      t.timestamps null: false
    end
  end
end
