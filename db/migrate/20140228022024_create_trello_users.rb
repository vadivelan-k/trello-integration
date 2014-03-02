class CreateTrelloUsers < ActiveRecord::Migration
  def change
    create_table :trello_users do |t|
      t.string :email
      t.string :token
      t.timestamps
    end
  end
end
