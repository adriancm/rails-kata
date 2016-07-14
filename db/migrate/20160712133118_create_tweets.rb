class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :message, limit: 150, null: false

      t.timestamps null: false
    end
  end
end
