User.destroy_all
Language.destroy_all
Lesson.destroy_all
Script.destroy_all

testman = User.create!(email:"dbcrocks@dbc.com", password:"password")

js = Language.create!(name: 'JavaScript')
ruby = Language.create!(name: 'Ruby')
python = Language.create!(name: 'Python')
objectivec = Language.create!(name: 'Objective C')

js_uno = js.lessons.create!(title: 'Parentheses ( )', difficulty_level: 1)
js_dos = js.lessons.create!(title: 'Brackets [ ]', difficulty_level: 2)
js_tres = js.lessons.create!(title: "Semi-Colons ;", difficulty_level: 3)
js_quatro = js.lessons.create!(title: 'Quotations " "', difficulty_level: 4)
js_cinco = js.lessons.create!(title: "Dollar Signs $", difficulty_level: 2)

ruby_uno = ruby.lessons.create!(title: 'Parentheses ( )', difficulty_level: 1)
ruby_dos = ruby.lessons.create!(title: "Colons :", difficulty_level: 2)
ruby_tres = js.lessons.create!(title: "Brackets [ ]", difficulty_level: 3)
ruby_quatro = ruby.lessons.create!(title: "Curly Braces { }", difficulty_level: 4)
ruby_cinco = ruby.lessons.create!(title: "Pipes | |", difficulty_level: 5)
ruby_seis = ruby.lessons.create!(title: "Underscores _", difficulty_level: 5)

p_uno = python.lessons.create!(title: "Lesson 1", difficulty_level: 1)
p_dos = python.lessons.create!(title: "Lesson 2", difficulty_level: 2)
p_tres = python.lessons.create!(title: "Lesson 3", difficulty_level: 3)
p_quatro = python.lessons.create!(title: "Lesson 4", difficulty_level: 4)
p_cinco = python.lessons.create!(title: "Lesson 5", difficulty_level: 5)

objectivec_uno = objectivec.lessons.create!(title: "Lesson 1", difficulty_level: 1)
objectivec_dos = objectivec.lessons.create!(title: "Lesson 2", difficulty_level: 2)
objectivec_tres = objectivec.lessons.create!(title: "Lesson 3", difficulty_level: 3)
objectivec_quatro = objectivec.lessons.create!(title: "Lesson 4", difficulty_level: 4)
objectivec_cinco = objectivec.lessons.create!(title: "Lesson 5", difficulty_level: 5)

js_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below!", text: "(var) (hello) (world)", sub_difficulty: 1, average_cps: 0)
js_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below!", text: "$(document).ready(function (){\n   this.name = name\n});", sub_difficulty: 2, average_cps: 0)
js_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below!", text: "var list = []\n $('#list').each(function(){\n  var name = $(this).find('.item');\n});", lesson_id: 1, sub_difficulty: 3, average_cps: 0)
js_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below!", text: "function sayHello() {\n  alert('Hello there!')\n}", sub_difficulty: 4, average_cps: 0)
js_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below!", text: "StoreList.getItems = function() {}", sub_difficulty: 5, average_cps: 0)
js_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below!", text: "var price = $(this).find('.price')", sub_difficulty: 6, average_cps: 0)

js_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: '$.post("/ajax", data, function(response)', sub_difficulty: 1, average_cps: 0)
js_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: 'console.log(returnValue);', sub_difficulty: 2, average_cps: 0)
js_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "var data = window.location.substr(1);", lesson_id: 1, sub_difficulty: 3, average_cps: 0)
js_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "$('#ajax_page').ready(function(){})", sub_difficulty: 4, average_cps: 0)
js_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "list.push({name: name[0].innerHTML})", sub_difficulty: 5, average_cps: 0)
js_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "var data = $('input[type='radio']').data();", sub_difficulty: 6, average_cps: 0)

ruby_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "() ( ) (   ) (hello)", sub_difficulty: 1, average_cps: 0)
ruby_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "(dbc) (rocks) (code) (code)", sub_difficulty: 2, average_cps: 0)
ruby_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "(class) (method) (string)", sub_difficulty: 3, average_cps: 0)
ruby_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "def recipe(ingredients) \n   all_recipes(cake)\nend", sub_difficulty: 4, average_cps: 0)
ruby_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "def initialize(shoes)\n   new_shoe(color) = current_color\n   new_shoe(size) = size\nend", sub_difficulty: 5, average_cps: 0)
ruby_uno.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "def initialize(cookies)\n   new_cookie(chocolate_chip) = chocolate_chip\n   new_cookie(size) = size\nend", sub_difficulty: 6, average_cps: 0)

ruby_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: ": : : : : : :a :b :c :d :e", sub_difficulty: 1, average_cps: 0)
ruby_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: ":cat :dog :fish :cow :monkey", sub_difficulty: 2, average_cps: 0)
ruby_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: ":blue :red :green :orange :purple", sub_difficulty: 3, average_cps: 0)
ruby_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "attr_reader :inventory, :shoe, :color", sub_difficulty: 4, average_cps: 0)
ruby_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "attr_accessor :temperature, :timer", sub_difficulty: 5, average_cps: 0)
ruby_dos.scripts.create!(instructions: "Practice your typing skills. Be sure to use the correct finger as shown on the diagram below.", text: "def initialize\n   attr_writer :rows, :columns, :boxes\n   attr_accessor :complete, :choices\nend", sub_difficulty: 6, average_cps: 0)

Lesson.all.each {|l| testman.lessons << l}

20.times do 
	testman.performances.create!(number_missed: Random.rand(1..30), total_characters: Random.rand(20..120), time_elapsed: "2000-01-01T00:00:42.000Z", wpm: Random.rand(2..6), missed_characters: "u,y,n,c,c,c,c,i,),;,i,t", script_id: js_uno.scripts.first.id)
end
