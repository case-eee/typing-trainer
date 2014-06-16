Language.destroy_all
Lesson.destroy_all
Script.destroy_all

js = Language.create!(name: 'JavaScript')
ruby = Language.create!(name: 'Ruby')
python = Language.create!(name: 'Python')

one = Lesson.create!(difficulty_level: 1, language_id: 1)
two = Lesson.create!(difficulty_level: 2, language_id: 1)
third = Lesson.create!(difficulty_level: 3, language_id: 1)
fourth = Lesson.create!(difficulty_level: 4, language_id: 1)

five = Lesson.create!(difficulty_level: 1, language_id: 2)
six = Lesson.create!(difficulty_level: 2, language_id: 2)
seven = Lesson.create!(difficulty_level: 3, language_id: 2)
eight = Lesson.create!(difficulty_level: 4, language_id: 2)

nine = Lesson.create!(difficulty_level: 1, language_id: 3)
ten = Lesson.create!(difficulty_level: 2, language_id: 3)
eleven = Lesson.create!(difficulty_level: 3, language_id: 3)
twelve = Lesson.create!(difficulty_level: 4, language_id: 3)

uno = Script.create!(text: '$(document).ready(function () { });', lesson_id: 1, sub_difficulty: 1)
dos = Script.create!(text: 'function Item(name, price) {this.name = name; this.price = price;}', lesson_id: 1, sub_difficulty: 2)
tres = Script.create!(text: "var list = [] $('#store_list tr.item').each(function(){var name = $(this).find('.item_name') });", lesson_id: 1, sub_difficulty: 3)
quatro = Script.create!(text: "var newItem = new Item() newItem['name'] = list[i].name;", lesson_id: 1, sub_difficulty: 4)
cinco = Script.create!(text: "StoreList.prototype.getItems = function() {for (var i = 0; i < list.length; i ++)", lesson_id: 1, sub_difficulty: 5)
seis = Script.create!(text: "var price = $(this).find('.item_price') list.push({name: name[0].innerHTML, price: price[0].innerHTML})", lesson_id: 1, sub_difficulty: 6)
