require_relative '../../config/application'

# this is where you should use an ActiveRecord migration to 

class CreateContacts < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :contacts do |columns|
      columns.string  :name
      columns.string  :phone
      columns.string  :house_number
      columns.string  :street
      columns.string  :zipcode
      columns.string  :state

      columns.timestamps null: false #basically creates the created_at and updated_at columns and make it as compulsory fields
    end
  end
end