Language.destroy_all
Lesson.destroy_all
Script.destroy_all

js = Language.create!(name: 'JavaScript')
ruby = Language.create!(name: 'Ruby')

one = Lesson.create!(difficulty_level: 1, language_id: 1)
two = Lesson.create!(difficulty_level: 1, language_id: 2)


uno = Script.create!(text: '$(document).ready(function () { });', lesson_id: 1, sub_difficulty: 1)
dos = Script.create!(text: 'function Item(name, price) {this.name = name; this.price = price;}', lesson_id: 1, sub_difficulty: 2)
tres = Script.create!(text: 'var list = [] $("#store_list tr.item").each(function(){var name = $(this).find(".item_name") });', lesson_id: 1, sub_difficulty: 3)
quatro = Script.create!(text: 'var newItem = new Item() \n newItem["name"] = list[i].name; \n newItem["price"] = list[i].price; \n this.addItem(newItem)', lesson_id: 1, sub_difficulty: 4)
cinco = Script.create!(text: 'StoreList.prototype.getItems = function() {for (var i = 0; i < list.length; i ++)', lesson_id: 1, sub_difficulty: 5)
seis = Script.create!(text: 'var price = $(this).find(".item_price") list.push({name: name[0].innerHTML, price: price[0].innerHTML})', lesson_id: 1, sub_difficulty: 6)
