class CreateAppearances < ActiveRecord::Migration[5.0]
  def change
    create_table :appearances do |t|
      t.integer :rating
      t.belongs_to :guest, foreign_key: true
      t.belongs_to :episode, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
