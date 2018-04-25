class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments, id: :uuid do |t|
      t.string :name, index: true

      t.timestamps
    end
  end
end
