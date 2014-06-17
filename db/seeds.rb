Language.destroy_all
Lesson.destroy_all
Script.destroy_all
User.destroy_all

test = User.create!(email: "test@test.com", password: "password")
mo = User.create!(email: "mo@test.com", password: "password")
erik = User.create!(email: "erik@test.com", password: "password")


js = Language.create!(name: 'JavaScript')
ruby = Language.create!(name: 'Ruby')
python = Language.create!(name: 'Python')

uno = js.lessons.create!(difficulty_level: 1)
dos = js.lessons.create!(difficulty_level: 2)

tres = ruby.lessons.create!(difficulty_level: 1)
quatro = ruby.lessons.create!(difficulty_level: 2)

cinco = python.lessons.create!(difficulty_level: 1)
seis = python.lessons.create!(difficulty_level: 2)


uno.scripts.create!(text: '$(document).ready(function () { });', sub_difficulty: 1, average_cps: 0)
uno.scripts.create!(text: 'function Item(name, price) {this.name = name; this.price = price;}', sub_difficulty: 2, average_cps: 0)
uno.scripts.create!(text: "var list = [] $('#store_list tr.item').each(function(){var name = $(this).find('.item_name') });", lesson_id: 1, sub_difficulty: 3, average_cps: 0)
uno.scripts.create!(text: "var newItem = new Item() newItem['name'] = list[i].name;", sub_difficulty: 4, average_cps: 0)
uno.scripts.create!(text: "StoreList.prototype.getItems = function() {for (var i = 0; i < list.length; i ++)", sub_difficulty: 5, average_cps: 0)
uno.scripts.create!(text: "var price = $(this).find('.item_price') list.push({name: name[0].innerHTML, price: price[0].innerHTML})", sub_difficulty: 6, average_cps: 0)

dos.scripts.create!(text: '$.post("/ajax", data, function(returnValue)', sub_difficulty: 1, average_cps: 0)
dos.scripts.create!(text: 'console.log(returnValue);', sub_difficulty: 2, average_cps: 0)
dos.scripts.create!(text: "var data = window.location.pathname.substr(1);", lesson_id: 1, sub_difficulty: 3, average_cps: 0)
dos.scripts.create!(text: "$('#ajax_page').ready(function(){})", sub_difficulty: 4, average_cps: 0)
dos.scripts.create!(text: "$.post(url, data, function(response){ $('#partial').html(response);});", sub_difficulty: 5, average_cps: 0)
dos.scripts.create!(text: "var data = $('input[type='radio']:checked').data();", sub_difficulty: 6, average_cps: 0)

tres.scripts.create!(text: "attr_reader :style_name, :inventory, :shoe, :color", sub_difficulty: 1, average_cps: 0)
tres.scripts.create!(text: "@inventory.each { |key, value| sum += value }", sub_difficulty: 2, average_cps: 0)
tres.scripts.create!(text: "shoes[0].inventory['white'] > shoes[0].inventory['black']", sub_difficulty: 3, average_cps: 0)
tres.scripts.create!(text: "first_column_items(shoes)[1].style_name == 'd'", sub_difficulty: 4, average_cps: 0)
tres.scripts.create!(text: "this_recipe = @all_recipes.select { |row| row.id.to_i == recipe_id.to_i }", sub_difficulty: 5, average_cps: 0)
tres.scripts.create!(text: "array_of_shoes.each_with_index { |style, index| first_column.push(style) if index % 3 == 0 }", sub_difficulty: 6, average_cps: 0)

test.lessons << uno
test.lessons << dos


mo.lessons << uno
mo.lessons << dos