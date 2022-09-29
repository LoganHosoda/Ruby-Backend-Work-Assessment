class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :url
      t.json :payload, null: false, defalut: '{}'

      t.timestamps
    end
  end
end
