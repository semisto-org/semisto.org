class CreateWaitlistSubscribers < ActiveRecord::Migration[7.0]
  def change
    create_table :waitlist_subscribers, id: :uuid do |t|
      t.string :email
      t.references :waitlist, null: false, foreign_key: true
      t.string :origin

      t.timestamps
    end
  end
end
