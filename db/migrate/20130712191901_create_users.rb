class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :pass
      t.string :name
      t.string :email
      t.string :phone
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
