# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.new
admin.username = 'admin'
admin.email = 'admin@admin.com'
admin.password = 'password'
admin.status = 1
admin.admin = true
admin.save

subscriber1 = User.find_by_username('subscriber1') || User.new
subscriber1.username = 'subscriber1'
subscriber1.email = 'subscriber1@subscriber.com'
subscriber1.password = 'password'
subscriber1.status = 1
subscriber1.admin = false
subscriber1.save

subscriber2 = User.find_by_username('subscriber2') || User.new
subscriber2.username = 'subscriber2'
subscriber2.email = 'subscriber2@subscriber.com'
subscriber2.password = 'password'
subscriber2.status = 1
subscriber2.admin = false
subscriber2.save

case Rails.env
when "development"
  device1 = Device.find_by_imei('1234567890') || Device.new
  device1.name = 'Samsung S3'
  device1.imei = '1234567890'
  device1.serial_number = 'serial1'
  device1.devise_type = 'Android'
  device1.os = 'Android'
  device1.hardware_platform = 'Core INTEL'
  device1.total_memory = '2 GB'
  device1.total_disk = '120 GB'
  device1.free_disk_space = '30 GB'
  device1.user = subscriber1
  device1.save

  device2 = Device.find_by_imei('1234567892') || Device.new
  device2.name = 'Samsung S2'
  device2.imei = '1234567892'
  device2.serial_number = 'serial2'
  device2.devise_type = 'Android'
  device2.os = 'Android'
  device2.hardware_platform = 'Core INTEL'
  device2.total_memory = '1 GB'
  device2.total_disk = '125 GB'
  device2.free_disk_space = '30 GB'
  device2.user = subscriber2
  device2.save


  device3 = Device.find_by_imei('1234567835') || Device.new
  device3.name = 'Samsung Grand'
  device3.imei = '1234567835'
  device3.serial_number = 'serial3'
  device3.devise_type = 'Android'
  device3.os = 'Android'
  device3.hardware_platform = 'Core INTEL'
  device3.total_memory = '1 GB'
  device3.total_disk = '125 GB'
  device3.free_disk_space = '30 GB'
  device3.user = subscriber1
  device3.save

  device3 = Device.find_by_imei('123456784575') || Device.new
  device3.name = 'Sony Ericson'
  device3.imei = '123456784575'
  device3.serial_number = 'seria43'
  device3.devise_type = 'Android'
  device3.os = 'Android'
  device3.hardware_platform = 'Core INTEL'
  device3.total_memory = '2 GB'
  device3.total_disk = '150 GB'
  device3.free_disk_space = '60 GB'
  device3.save

  contact1 = Contact.find_by_uniqid('1') || Contact.new
  contact1.uniqid = '1'
  contact1.number = '9910896895'
  contact1.name = 'User 1'
  contact1.device = device1
  contact1.save

  contact2 = Contact.find_by_uniqid('2') || Contact.new
  contact2.uniqid = '2'
  contact2.number = '9910896896'
  contact2.name = 'User 2'
  contact2.device = device1
  contact2.save

  contact3 = Contact.find_by_uniqid('3') || Contact.new
  contact3.uniqid = '3'
  contact3.number = '9910896897'
  contact3.name = 'User 3'
  contact3.device = device2
  contact3.save

  logs1 = Log.find_by_uniqid('1') || Log.new
  logs1.uniqid = '1'
  logs1.contact = contact1
  logs1.log_type = 'IN'
  logs1.time = Time.now
  logs1.duration = 3.3
  logs1.device = device1
  logs1.save

  logs2 = Log.find_by_uniqid('2') || Log.new
  logs2.uniqid = '2'
  logs2.contact = contact1
  logs2.log_type = 'OUT'
  logs2.time = Time.now
  logs2.duration = 4.1
  logs2.device = device1
  logs2.save

  logs3 = Log.find_by_uniqid('3') || Log.new
  logs3.uniqid = '3'
  logs3.contact = contact2
  logs3.log_type = 'IN'
  logs3.time = Time.now
  logs3.duration = 3.2
  logs3.device = device1
  logs3.save

  logs4 = Log.find_by_uniqid('4') || Log.new
  logs4.uniqid = '4'
  logs4.contact = contact2
  logs4.log_type = 'OUT'
  logs4.time = Time.now
  logs4.duration = 3.3
  logs4.device = device1
  logs4.save

  sms1 = Message.find_by_uniqid('1') || Message.new
  sms1.uniqid = '1'
  sms1.contact = contact2
  sms1.msg_type = 'IN'
  sms1.message = 'What are you doing'
  sms1.time = Time.now
  sms1.device = device1
  sms1.save

  sms2 = Message.find_by_uniqid('2') || Message.new
  sms2.uniqid = '2'
  sms2.contact = contact2
  sms2.msg_type = 'OUT'
  sms2.message = 'I am at home, it is so boring these days, whot not planing for some outing. What do you say? I am free on next week. We can plan for GOA, What you say?'
  sms2.time = Time.now
  sms2.device = device1
  sms2.save

  app1 = App.find_by_program('Whats Up') || App.new
  app1.program = 'Whats Up'
  app1.version = '1.0.5'
  app1.package = 'Entertainment'
  app1.device = device1
  app1.save

  app2 = App.find_by_program('MS Word') || App.new
  app2.program = 'MS Word'
  app2.version = '2.0.5'
  app2.package = 'MS Office'
  app2.device = device1
  app2.save

  app3 = App.find_by_program('MS Excel') || App.new
  app3.program = 'MS Excel'
  app3.version = '2.5.5'
  app3.package = 'MS Office'
  app3.device = device2
  app3.save

  app4 = App.find_by_program('MS Image Viewer') || App.new
  app4.program = 'MS Image Viewer'
  app4.version = '1.3.5'
  app4.package = 'MS Office'
  app4.device = device2
  app4.save

  app5 = App.find_by_program('Pdf Preview') || App.new
  app5.program = 'Pdf Preview'
  app5.version = '8.1.1'
  app5.package = 'MS Office'
  app5.device = device3
  app5.save

  loc1 = Location.new
  loc1.latitude = '20.4518154'
  loc1.longitude = '11.5454154'
  loc1.time = Time.now
  loc1.device = device1
  loc1.save

  loc2 = Location.new
  loc2.latitude = '18.4875154'
  loc2.longitude = '13.5128154'
  loc2.time = Time.now
  loc2.device = device2
  loc2.save

  loc3 = Location.new
  loc3.latitude = '21.4578154'
  loc3.longitude = '15.5478154'
  loc3.time = Time.now
  loc3.device = device2
  loc3.save

  loc4 = Location.new
  loc4.latitude = '20.4578154'
  loc4.longitude = '19.5478154'
  loc4.time = Time.now
  loc4.device = device3
  loc4.save
end
