class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :url
      t.string :position

      t.timestamps null: false
    end
  end
end
