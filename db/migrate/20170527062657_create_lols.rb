class CreateLols < ActiveRecord::Migration
  def change
    create_table :lols do |t|
      t.text :content
      t.text :url
      t.timestamps null: false
    end
  end
end
