class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :topic
      t.references :user

      t.timestamps
    end
  end
end
