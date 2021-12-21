class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :article
      t.references :user

      t.timestamps
    end
  end
end
