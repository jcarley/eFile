# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item do
    name "MyString"
    description "MyString"
    model_number 1
    manufacturer "MyString"
    website "MyString"
    purchase_price "MyString"
    purchase_date "2013-06-01 07:41:01"
    document_count 1
    note_count 1
    serial_number "MyString"
    item_code "MyString"
    invoice_number "MyString"
    type ""
  end
end
