class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone_number
      t.string :email
      t.text :decription
      #t.boolean :is_admin?

      t.timestamps
    end
  end
end
