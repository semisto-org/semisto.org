class CreateWaitlists < ActiveRecord::Migration[7.0]
  def change
    create_table :waitlists do |t|
      t.string :name
      t.string :slug
      t.boolean :active

      t.timestamps
    end
  end
end
