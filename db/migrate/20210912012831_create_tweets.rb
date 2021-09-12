class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.text :body
      t.integer :likes

      t.timestamps
    end
  end
end
