# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

us = [{name: '冯冯'}, {name: '小妞'}]
users = us.collect {|u| User.find_or_create_by(u)}

ff = users.first
xn = users.second
msgs = [{sender_id: xn.id, sender: xn.name, receiver_id: ff.id, receiver: ff.name, content: '你在干嘛'},
				{sender_id: ff.id, sender: ff.name, receiver_id: xn.id, receiver: xn.name, content: '在写代码'},
				{sender_id: xn.id, sender: xn.name, receiver_id: ff.id, receiver: ff.name, content: '写什么代码呀'}]
messages = msgs.collect{ |msg| Message.find_or_create_by(msg) }
