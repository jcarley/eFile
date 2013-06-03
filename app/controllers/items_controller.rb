class ItemsController < ApplicationController

  respond_to :json

  def index
    items = []

    item = Item.new
    item.name = "Festool OF 1400 EQ"
    item.document_count = 4
    item.note_count = 1
    items << item

    item = Item.new
    item.name = "Festool MFT/3"
    item.document_count = 2
    item.note_count = 4
    items << item

    item = Item.new
    item.name = "STIHL Trimmer FS 40"
    item.document_count = 1
    item.note_count = 0
    items << item

    item = Item.new
    item.name = "STIHL Blower BG 56"
    item.document_count = 2
    item.note_count = 6
    items << item

    item = Item.new
    item.name = "Festool LR32"
    item.document_count = 4
    item.note_count = 0
    items << item

    item = Item.new
    item.name = "Powermatic 2000 Tablesaw"
    item.document_count = 1
    item.note_count = 0
    items << item

    respond_with items
  end
end
