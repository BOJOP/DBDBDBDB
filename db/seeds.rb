# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


department_name = ["COMPUTER ENGINEERING",
"CHEMISTRY ENGINEERING",
"SCIENCE OF PHYSICS ",
"SCIENCE OF CHEMISTRY",
"SCIENCE OF MATHEMATICS",
"COMMERCE AND ACCOUNTANCY",
"MECHANICAL ENGINEERING",
"COMMUNICATION ARTS",
"ECONOMICS",
"MEDICINE",
"VETERINARY SCIENCE",
"DENTISTRY",
"PHARMACEUTICAL SCIENCES",
"INTERNATIONAL LAW",
"CIVIL ENGINEERING",
"NANOTECHONOGY ENGINEERING",
"ELECTRICAL ENGINEERING",
"INDUSTRIAL ENGINEERING",
"SOFTWARE ENGINEERING"]

#Department_create
puts "Department create"
department_number = 21
for i in 0..(department_name.length-1)
	Department.create(name: department_name[i],
						id: department_number)
	department_number += 1
end

#Curriculum_create
puts "Curriculum create"
for i in 0..9
	Curriculum.create(name: "CUR NAME No.#{i}",
					description: "Description No.#{i}",
					department_id: Department.offset(i%5).first.id,
					)
end

#Student_create
puts "Student create"
Student.create(id: "5731079821", first_name: 'พัชริดา', 	last_name: 'พัดพาดี', picture: 'pic_url_here', ssn: '10000000000', birth_date:'1-1-1994', gender: 'Female', enroll_year: '2013', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '1')
Student.create(id: "5731110521", first_name: 'โสภิตา', 	last_name: 'ปัญญาคำ', picture: 'pic_url_here', ssn: '10000000001', birth_date:'1-1-1996', gender: 'Female', enroll_year: '2013', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '1')
Student.create(id: "5730300221", first_name: 'นันทนัช', 	last_name: 'ยืนยงเดชาวัฒน์', picture: 'pic_url_here', ssn: '10000000002', birth_date:'1-1-1995', gender: 'Female', enroll_year: '2014', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '1')
Student.create(id: "5730119021", first_name: 'ชวิศา', 	last_name: 'ธรรมจรัส', picture: 'pic_url_here', ssn: '10000000003', birth_date:'1-1-1995', gender: 'Female', enroll_year: '2015', status: 'Studying', email: 'abcd.chavisa@gmail.com', curriculum_id: '1')
Student.create(id: "5731074621", first_name: 'ปาลิดา', 	last_name: 'ทองทิวา', picture: 'pic_url_here', ssn: '10000000004', birth_date:'1-1-1995', gender: 'Female', enroll_year: '2016', status: 'Studying', email: 'abcd.th@hotmail.com', curriculum_id: '1')
Student.create(id: "5731075221", first_name: 'ปิยะฉัตร', 	last_name: 'มงคลพัฒนกุล', picture: 'pic_url_here', ssn: '10000000005', birth_date:'1-1-1996', gender: 'Female', enroll_year: '2013', status: 'Studying', email: 'abcd-9@hotmail.com', curriculum_id: '1')
Student.create(id: "5730321421", first_name: 'ปณิดา', 	last_name: 'วิริยะชัยพร', picture: 'pic_url_here', ssn: '10000000006', birth_date:'1-1-1996', gender: 'Female', enroll_year: '2013', status: 'Studying', email: 'abcd.s@gmail.com', curriculum_id: '1')
Student.create(id: "5730402621", first_name: 'พิมพ์ชนก', 	last_name: 'พงศ์สุพรรณกิจ', picture: 'pic_url_here', ssn: '10000000007', birth_date:'1-1-1995', gender: 'Female', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '1')
Student.create(id: "5730635521", first_name: 'สิรินทรา', 	last_name: 'จันทะราช', picture: 'pic_url_here', ssn: '10000000008', birth_date:'1-1-1996', gender: 'Female', enroll_year: '2016', status: 'Studying', email: 'abcd.cc@gmail.com', curriculum_id: '1')
Student.create(id: "5731069521", first_name: 'บุญลักษณ์', 	last_name: 'สันติธำรงวิทย์', picture: 'pic_url_here', ssn: '10000000009', birth_date:'1-1-1995', gender: 'Female', enroll_year: '2013', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '1')
Student.create(id: "5731078121", first_name: 'พรรษพิรุณ', 	last_name: 'ถิรจิตโต', picture: 'pic_url_here', ssn: '10000000010', birth_date:'1-1-1995', gender: 'Female', enroll_year: '2016', status: 'Studying', email: 'abcd.ppt@gmail.com', curriculum_id: '10')
Student.create(id: "5731101921", first_name: 'ศศิชา', 	last_name: 'พูนพล', picture: 'pic_url_here', ssn: '10000000011', birth_date:'1-1-1996', gender: 'Female', enroll_year: '2014', status: 'Studying', email: 'abcd-yoon_eun_hae@hotmail.com', curriculum_id: '4')
Student.create(id: "5730677921", first_name: 'อรพรรณ', 	last_name: 'โพธิ์งามวงศ์', picture: 'pic_url_here', ssn: '10000000012', birth_date:'1-1-1995', gender: 'Female', enroll_year: '2014', status: 'Studying', email: 'abcd.op@gmail.com', curriculum_id: '4')
Student.create(id: "5731055721", first_name: 'ธาริณี', 	last_name: 'มั่นความดี', picture: 'pic_url_here', ssn: '10000000013', birth_date:'1-1-1995', gender: 'Female', enroll_year: '2016', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '10')
Student.create(id: "5730295821", first_name: 'นวินดา', 	last_name: 'บุญประโลม', picture: 'pic_url_here', ssn: '10000000014', birth_date:'1-1-1995', gender: 'Female', enroll_year: '2014', status: 'Studying', email: 'abcd.elf_129@hotmail.com', curriculum_id: '2')
Student.create(id: "5731092921", first_name: 'มินตรา', 	last_name: 'นานคงแนบ', picture: 'pic_url_here', ssn: '10000000015', birth_date:'1-1-1995', gender: 'Female', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '2')
Student.create(id: "5731007621", first_name: 'กานต์กวี', 	last_name: 'ชนะสิทธิ์', picture: 'pic_url_here', ssn: '10000000016', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '2')
Student.create(id: "5731004721", first_name: 'กวิน', 	last_name: 'เหลี่ยววงค์ภูธร', picture: 'pic_url_here', ssn: '10000000017', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '2')
Student.create(id: "5730688821", first_name: 'อัชระพนธ์', 	last_name: 'ศิลมัฐ', picture: 'pic_url_here', ssn: '10000000018', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '3')
Student.create(id: "5731009921", first_name: 'เกรียงศักดิ์', 	last_name: 'หทัยเกษมสุข', picture: 'pic_url_here', ssn: '10000000019', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd.P.K.channel@gmail.com', curriculum_id: '3')
Student.create(id: "5731111121", first_name: 'อธิป', 	last_name: 'อินทรภิรมย์', picture: 'pic_url_here', ssn: '10000000020', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '3')
Student.create(id: "5731035121", first_name: 'ณัฐภัทร', 	last_name: 'กิระวิทยา', picture: 'pic_url_here', ssn: '10000000021', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2013', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '3')
Student.create(id: "5730282621", first_name: 'นนทิวัฒน์', 	last_name: 'วิสุทธิไกรสีห์', picture: 'pic_url_here', ssn: '10000000022', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '3')
Student.create(id: "5731040221", first_name: 'ธนกฤต', 	last_name: 'โกวิทวณิช', picture: 'pic_url_here', ssn: '10000000023', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2013', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '2')
Student.create(id: "5730241921", first_name: 'ธนวัฒน์', 	last_name: 'สอสะอาด', picture: 'pic_url_here', ssn: '10000000024', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '2')
Student.create(id: "5730196321", first_name: 'ดนุภัทร', 	last_name: 'คำนวนสินธุ์', picture: 'pic_url_here', ssn: '10000000025', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '2')
Student.create(id: "5730398821", first_name: 'พิชญุตม์', 	last_name: 'จิตรศิลป์ฉายากุล', picture: 'pic_url_here', ssn: '10000000026', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd.jr@hotmail.com', curriculum_id: '2')
Student.create(id: "5730192821", first_name: 'ณัฐสิทธิ์', 	last_name: 'มหากุศลศิริกุล', picture: 'pic_url_here', ssn: '10000000027', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd.mah@gmail.com', curriculum_id: '3')
Student.create(id: "5730251121", first_name: 'ธเนศ', 	last_name: 'สิริจรรยาพงศ์', picture: 'pic_url_here', ssn: '10000000028', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '3')
Student.create(id: "5730367321", first_name: 'พชร', 	last_name: 'โชคดุรงค์', picture: 'pic_url_here', ssn: '10000000029', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '3')
Student.create(id: "5730328921", first_name: 'ปริญญ์', 	last_name: 'จิตเสรีธรรม', picture: 'pic_url_here', ssn: '10000000030', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '2')
Student.create(id: "5730281021", first_name: 'นนทัช', 	last_name: 'บุณยมานนท์', picture: 'pic_url_here', ssn: '10000000031', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '2')
Student.create(id: "5730174521", first_name: 'ณัฐพล', 	last_name: 'รักษ์รัชตกุล', picture: 'pic_url_here', ssn: '10000000032', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2014', status: 'Exchange Program', email: 'abcd@hotmail.com', curriculum_id: '3')
Student.create(id: "5730411221", first_name: 'พีรณัฐ', 	last_name: 'จริยรักษ์วรกุล', picture: 'pic_url_here', ssn: '10000000033', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '9')
Student.create(id: "5731018521", first_name: 'จิรันตน์', 	last_name: 'บวรกิติวงศ์', picture: 'pic_url_here', ssn: '10000000034', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '3')
Student.create(id: "5731087821", first_name: 'ภาคภูมิ', 	last_name: 'ทวีสิทธิชาติ', picture: 'pic_url_here', ssn: '10000000035', birth_date:'1-1-1993', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd.tha@outlook.com', curriculum_id: '8')
Student.create(id: "5731091221", first_name: 'ภุมรินทร์', 	last_name: 'พลอยพิศุทธิ์', picture: 'pic_url_here', ssn: '10000000036', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd.161@hotmail.com', curriculum_id: '8')
Student.create(id: "5730243121", first_name: 'ธนัช', 	last_name: 'จตุภัทรฉัตร', picture: 'pic_url_here', ssn: '10000000037', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd.jat@gmail.com', curriculum_id: '8')
Student.create(id: "5731022021", first_name: 'ชัชชนก', 	last_name: 'อาศุเวทย์', picture: 'pic_url_here', ssn: '10000000038', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2013', status: 'Exchange Program', email: 'abcd@hotmail.com', curriculum_id: '8')
Student.create(id: "5730684221", first_name: 'อวยชัย', 	last_name: 'บูรณมานิต', picture: 'pic_url_here', ssn: '10000000039', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2013', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '8')
Student.create(id: "5731045421", first_name: 'ธนภัทร', 	last_name: 'อารีจิตสกุล', picture: 'pic_url_here', ssn: '10000000040', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '8')
Student.create(id: "5731059221", first_name: 'ธีรภัทร', 	last_name: 'สุจิตโต', picture: 'pic_url_here', ssn: '10000000041', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd.s@gmail.com', curriculum_id: '8')
Student.create(id: "5730365021", first_name: 'พงศยา', 	last_name: 'สมบูรณ์พงศ์', picture: 'pic_url_here', ssn: '10000000042', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '8')
Student.create(id: "5731015621", first_name: 'จิรพัฒน์', 	last_name: 'อติวัฒนชัย', picture: 'pic_url_here', ssn: '10000000043', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '8')
Student.create(id: "5731014021", first_name: 'จาตุรนต์', 	last_name: 'ศุภศรี', picture: 'pic_url_here', ssn: '10000000044', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '8')
Student.create(id: "5731032221", first_name: 'ณพล', 	last_name: 'อยรังสฤษฎ์กูล', picture: 'pic_url_here', ssn: '10000000045', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '3')
Student.create(id: "5731086121", first_name: 'ภควัต', 	last_name: 'ลีลาคหกิจ', picture: 'pic_url_here', ssn: '10000000046', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2013', status: 'Exchange Program', email: 'abcd@hotmail.com', curriculum_id: '3')
Student.create(id: "5731095821", first_name: 'วสุวัชร', 	last_name: 'สถิตธรรมจิตร', picture: 'pic_url_here', ssn: '10000000047', birth_date:'1-1-1990', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '3')
Student.create(id: "5730625221", first_name: 'สิทธิชัย', 	last_name: 'แซ่เจี่ย', picture: 'pic_url_here', ssn: '10000000048', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '3')
Student.create(id: "5731068921", first_name: 'บรรณ', 	last_name: 'อุทัยธิรัตน์', picture: 'pic_url_here', ssn: '10000000049', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '3')
Student.create(id: "5730410621", first_name: 'พีรกิต', 	last_name: 'อุ่มบางตลาด', picture: 'pic_url_here', ssn: '10000000050', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2013', status: 'Studying', email: 'abcd-of-infinity@hotmail.com', curriculum_id: '3')
Student.create(id: "5730540521", first_name: 'วศิน', 	last_name: 'ปณิธานศิริกุล', picture: 'pic_url_here', ssn: '10000000051', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2014', status: 'Exchange Program', email: 'abcd.p1995@gmail.com', curriculum_id: '9')
Student.create(id: "5731020721", first_name: 'เจตพัฒน์', 	last_name: 'ทิตอร่าม', picture: 'pic_url_here', ssn: '10000000052', birth_date:'1-1-1994', gender: 'Male', enroll_year: '2014', status: 'Intermission Leave', email: 'abcd@hotmail.com', curriculum_id: '9')
Student.create(id: "5731088421", first_name: 'ภานุพงศ์', 	last_name: 'ทองธวัช', picture: 'pic_url_here', ssn: '10000000053', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd.not@hotmail.com', curriculum_id: '9')
Student.create(id: "5731109021", first_name: 'สุธรรม', 	last_name: 'ธิติอนันต์ปกรณ์', picture: 'pic_url_here', ssn: '10000000054', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '9')
Student.create(id: "5730175121", first_name: 'ณัฐพล', 	last_name: 'เราพิพัฒน์พงษ์', picture: 'pic_url_here', ssn: '10000000055', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2013', status: 'Dropped', email: 'abcd@hotmail.com', curriculum_id: '10')
Student.create(id: "5731036821", first_name: 'ณัฐภัทร', 	last_name: 'บุญประคอง', picture: 'pic_url_here', ssn: '10000000056', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '4')
Student.create(id: "5731048321", first_name: 'ธนิน', 	last_name: 'ตันเฉี่ยง', picture: 'pic_url_here', ssn: '10000000057', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2013', status: 'Exchange Program', email: 'abcd@hotmail.com', curriculum_id: '4')
Student.create(id: "5731047721", first_name: 'ธนะ', 	last_name: 'กิจกุลอนันตเอก', picture: 'pic_url_here', ssn: '10000000058', birth_date:'1-1-1994', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '10')
Student.create(id: "5731077521", first_name: 'พงษ์พีรเดช', 	last_name: 'ชัยธรรม', picture: 'pic_url_here', ssn: '10000000059', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '10')
Student.create(id: "5731065021", first_name: 'นัทธ์', 	last_name: 'ศรีเรือนทอง', picture: 'pic_url_here', ssn: '10000000060', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '10')
Student.create(id: "5731112821", first_name: 'อนุรุธ', 	last_name: 'เลิศปิยะ', picture: 'pic_url_here', ssn: '10000000061', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@me.com', curriculum_id: '9')
Student.create(id: "5730529721", first_name: 'วริทธิ์ธร', 	last_name: 'สุทธิิโสภาอาภรณ์', picture: 'pic_url_here', ssn: '10000000062', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2014', status: 'Intermission Leave', email: 'abcd@gmail.com', curriculum_id: '9')
Student.create(id: "5730447921", first_name: 'ภาณุวิชญ์', 	last_name: 'วงศ์อนันต์กิจ', picture: 'pic_url_here', ssn: '10000000063', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '9')
Student.create(id: "5731070021", first_name: 'บุญศรัณย์', 	last_name: 'ขจรกลิ่นมาลา', picture: 'pic_url_here', ssn: '10000000064', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Intermission Leave', email: 'abcd@hotmail.com', curriculum_id: '10')
Student.create(id: "5730593821", first_name: 'ศุภกฤต', 	last_name: 'เปาลิวัฒน์', picture: 'pic_url_here', ssn: '10000000065', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2013', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '10')
Student.create(id: "5731119221", first_name: 'เอกธนัช', 	last_name: 'อัฑฒพงษ์', picture: 'pic_url_here', ssn: '10000000066', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '10')
Student.create(id: "5730022821", first_name: 'กฤษดา', 	last_name: 'พรรัตน์ธนพงศ์', picture: 'pic_url_here', ssn: '10000000067', birth_date:'1-1-1995', gender: 'Female', enroll_year: 1986, status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '10')
Student.create(id: "5730303121", first_name: 'นิธิชัย', 	last_name: 'ติยอมรวงศ์', picture: 'pic_url_here', ssn: '10000000068', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '10')
Student.create(id: "5731076921", first_name: 'พงศธร', 	last_name: 'โชติพันธุ์วิทยากุล', picture: 'pic_url_here', ssn: '10000000069', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@windowslive.com', curriculum_id: '4')
Student.create(id: "5731002421", first_name: 'กรวีร์', 	last_name: 'การุณรัตนกุล', picture: 'pic_url_here', ssn: '10000000070', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '4')
Student.create(id: "5730315721", first_name: 'บุริศร์', 	last_name: 'ชลวิรัชกุล', picture: 'pic_url_here', ssn: '10000000071', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '4')
Student.create(id: "5730271721", first_name: 'ธีรโชติ', 	last_name: 'บุญประภากร', picture: 'pic_url_here', ssn: '10000000072', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Exchange Program', email: 'abcd@gmail.com', curriculum_id: '5')
Student.create(id: "5730679121", first_name: 'อรรถพร', 	last_name: 'พินิจนารถ', picture: 'pic_url_here', ssn: '10000000073', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '9')
Student.create(id: "5730325021", first_name: 'ปพน', 	last_name: 'ตรงประกอบ', picture: 'pic_url_here', ssn: '10000000074', birth_date:'1-1-1994', gender: 'Male', enroll_year: '2014', status: 'Studying', email: 'abcd.pop@hotmail.com', curriculum_id: '9')
Student.create(id: "5730541121", first_name: 'วศิน', 	last_name: 'วัฒนศรีส่ง', picture: 'pic_url_here', ssn: '10000000075', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2014', status: 'Intermission Leave', email: 'abcd@hotmail.com', curriculum_id: '9')
Student.create(id: "5730108121", first_name: 'ชนาธิป', 	last_name: 'แซ่เตีย', picture: 'pic_url_here', ssn: '10000000076', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '9')
Student.create(id: "5731001821", first_name: 'กนกพล', 	last_name: 'ธงไชยเจริญสิริ', picture: 'pic_url_here', ssn: '10000000077', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd.pppping@hotmail.com', curriculum_id: '9')
Student.create(id: "5730399421", first_name: 'พิชญุุตม์', 	last_name: 'พฤฒิพฤกษ์', picture: 'pic_url_here', ssn: '10000000078', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd.green.emerald@gmail.com', curriculum_id: '9')
Student.create(id: "5731054021", first_name: 'ธารา', 	last_name: 'ธรรมมานุธรรม', picture: 'pic_url_here', ssn: '10000000079', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2012', status: 'Intermission Leave', email: 'abcd@hotmail.com', curriculum_id: '6')
Student.create(id: "5730456521", first_name: 'ภาสกร', 	last_name: 'เฮงประเสริฐ', picture: 'pic_url_here', ssn: '10000000080', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd.em@gmail.com', curriculum_id: '6')
Student.create(id: "5731005321", first_name: 'กษิดิศ', 	last_name: 'เอี่ยมทอง', picture: 'pic_url_here', ssn: '10000000081', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@outlook.com', curriculum_id: '6')
Student.create(id: "5731058621", first_name: 'ธีรพจน์', 	last_name: 'แซ่ลิน', picture: 'pic_url_here', ssn: '10000000082', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '6')
Student.create(id: "5731062021", first_name: 'นพวิทย์', 	last_name: 'ไทยรุ่งโรจน์', picture: 'pic_url_here', ssn: '10000000084', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd.mamypoko@gmail.com', curriculum_id: '6')
Student.create(id: "5731083221", first_name: 'พีรวุฒิ', 	last_name: 'เหลืองเรืองโรจน์', picture: 'pic_url_here', ssn: '10000000085', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd.luang45@gmail.com', curriculum_id: '6')
Student.create(id: "5731105421", first_name: 'ศุภวิชญ์', 	last_name: 'คงธนาฤทธิ์', picture: 'pic_url_here', ssn: '10000000086', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Exchange Program', email: 'abcd@hotmail.com', curriculum_id: '6')
Student.create(id: "5731019121", first_name: 'จิรายุ', 	last_name: 'อริยเดช', picture: 'pic_url_here', ssn: '10000000087', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Exchange Program', email: 'abcd@gmail.com', curriculum_id: '6')
Student.create(id: "5730185421", first_name: 'ณัฐวัฒน์', 	last_name: 'ประดุจเดชา', picture: 'pic_url_here', ssn: '10000000088', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Exchange Program', email: 'abcd@gmail.com', curriculum_id: '9')
Student.create(id: "5731081021", first_name: 'พิทวัส', 	last_name: 'นักร้อง', picture: 'pic_url_here', ssn: '10000000089', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Exchange Program', email: 'abcd@gmail.com', curriculum_id: '5')
Student.create(id: "5730160721", first_name: 'ณัฐชนสรณ์', 	last_name: 'พรมมา', picture: 'pic_url_here', ssn: '10000000090', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '5')
Student.create(id: "5731084921", first_name: 'พุฒิพัฒน์', 	last_name: 'ศรีรัตน์ภิญโญ', picture: 'pic_url_here', ssn: '10000000091', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd.puttiphatmd@gmail.com', curriculum_id: '6')
Student.create(id: "5731100221", first_name: 'วีรภัทร์', 	last_name: 'จึงสมเจตไพศาล', picture: 'pic_url_here', ssn: '10000000092', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd-rst@hotmail.com', curriculum_id: '6')
Student.create(id: "5731006021", first_name: 'กันตณัฐ', 	last_name: 'ชูเกียรติ', picture: 'pic_url_here', ssn: '10000000093', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Intermission Leave', email: 'abcd.kie0412@gmail.com', curriculum_id: '6')
Student.create(id: "5731017921", first_name: 'จิรัฏฐ์', 	last_name: 'โพธิ์โลหะกุล', picture: 'pic_url_here', ssn: '10000000094', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '7')
Student.create(id: "5731042521", first_name: 'ธนพนธ์', 	last_name: 'ศิริสมภาค', picture: 'pic_url_here', ssn: '10000000095', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Intermission Leave', email: 'abcd@hotmail.com', curriculum_id: '7')
Student.create(id: "5730106921", first_name: 'ชนาธิป', 	last_name: 'เกรียงไกรเพชร', picture: 'pic_url_here', ssn: '10000000096', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '7')
Student.create(id: "5730279821", first_name: 'ธีรภาพ', 	last_name: 'อภิปาลกุล', picture: 'pic_url_here', ssn: '10000000097', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '7')
Student.create(id: "5731050521", first_name: 'ธัชชัย', 	last_name: 'เจียมศร', picture: 'pic_url_here', ssn: '10000000098', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@windowslive.com', curriculum_id: '7')
Student.create(id: "5731113421", first_name: 'อภิรุจ', 	last_name: 'ชุ่มวัฒนะ', picture: 'pic_url_here', ssn: '10000000099', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '7')
Student.create(id: "5730097921", first_name: 'เจษฎา', 	last_name: 'ไวส์คาร์เวอร์', picture: 'pic_url_here', ssn: '10000000100', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd.wise@gmail.com', curriculum_id: '7')
Student.create(id: "5730662421", first_name: 'อติพงศ์', 	last_name: 'โกมารกุล ณ นคร', picture: 'pic_url_here', ssn: '10000000101', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status:'Studying', email: 'abcd.gnow@gmail.com', curriculum_id: '7')
Student.create(id: "5730054921", first_name: 'ขจรพล', 	last_name: 'อานันทนิตย์', picture: 'pic_url_here', ssn: '10000000102', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '7')
Student.create(id: "5730467421", first_name: 'ภูริณัฐ', 	last_name: 'จันทร์หอม', picture: 'pic_url_here', ssn: '10000000103', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '7')
Student.create(id: "5730653821", first_name: 'สุวพัชร', 	last_name: 'วรสิทธิ์', picture: 'pic_url_here', ssn: '10000000104', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Intermission Leave', email: 'abcd.wow@gmail.com', curriculum_id: '7')
Student.create(id: "5731013321", first_name: 'คณิติน', 	last_name: 'จันทร์ประเสริฐ', picture: 'pic_url_here', ssn: '10000000105', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '7')
Student.create(id: "5730518821", first_name: 'วรรธนัย', 	last_name: 'บุรีทาน', picture: 'pic_url_here', ssn: '10000000106', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '7')
Student.create(id: "5731037421", first_name: 'ตรัยรัตน์', 	last_name: 'ปัญญาวัฒนานุกูล', picture: 'pic_url_here', ssn: '10000000107', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2015', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '7')
Student.create(id: "5730337521", first_name: 'ปัญญพล', 	last_name: 'ชื่นวัฒนกุล', picture: 'pic_url_here', ssn: '10000000108', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '7')
Student.create(id: "5731012721", first_name: 'โกเศส', 	last_name: 'ลิ้มพงษา', picture: 'pic_url_here', ssn: '10000000109', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '7')
Student.create(id: "5731034521", first_name: 'ณัฐภัท', 	last_name: 'ธานินธรณ์', picture: 'pic_url_here', ssn: '10000000110', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Intermission Leave', email: 'abcd@outlook.com', curriculum_id: '7')
Student.create(id: "5730539021", first_name: 'วศิน', 	last_name: 'แซ่โง้ว', picture: 'pic_url_here', ssn: '10000000111', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2016', status: 'Intermission Leave', email: 'abcd@hotmail.co.th', curriculum_id: '5')
Student.create(id: "5730626921", first_name: 'สิทธินนท์', 	last_name: 'มั่นพรรษา', picture: 'pic_url_here', ssn: '10000000112', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '5')
Student.create(id: "5731033921", first_name: 'ณัฐนันท์', 	last_name: 'วัชรเกษมสินธุ์', picture: 'pic_url_here', ssn: '10000000113', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '8')
Student.create(id: "5730329521", first_name: 'ปรินทร', 	last_name: 'ทรายทอง', picture: 'pic_url_here', ssn: '10000000114', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '8')
Student.create(id: "5731104821", first_name: 'ดนุภัทร', 	last_name: 'รงศ์เหลืองอร่าม', picture: 'pic_url_here', ssn: '10000000115', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '8')
Student.create(id: "5730400321", first_name: 'พิชไนย', 	last_name: 'ฐิติภากร', picture: 'pic_url_here', ssn: '10000000116', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '8')
Student.create(id: "5731114021", first_name: 'อัมรินทร์', 	last_name: 'เจตน์ฐากูร', picture: 'pic_url_here', ssn: '10000000117', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@outlook.com', curriculum_id: '8')
Student.create(id: "5731025921", first_name: 'ชัยภัทร', 	last_name: 'จุลศรี', picture: 'pic_url_here', ssn: '10000000118', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd.8000@gmail.com', curriculum_id: '5')
Student.create(id: "5730059021", first_name: 'คณิน', 	last_name: 'ศุภสัจญาณกุล', picture: 'pic_url_here', ssn: '10000000119', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2016', status: 'Studying', email: 'abcd@hotmail.com', curriculum_id: '5')
Student.create(id: "5731008221", first_name: 'กิติพงษ์', 	last_name: 'ศิริเรืองสกุล', picture: 'pic_url_here', ssn: '10000000120', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2016', status: 'Dropped', email: 'abcd@hotmail.com', curriculum_id: '5')
Student.create(id: "5731071721", first_name: 'ปธานิน', 	last_name: 'โลกโบว์', picture: 'pic_url_here', ssn: '10000000121', birth_date:'1-1-1996', gender: 'Female', enroll_year: '2012', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '5')
Student.create(id: "5730657321", first_name: 'เสฏฐวุฒิ', 	last_name: 'อดิศัยสกุลเดช', picture: 'pic_url_here', ssn: '10000000122', birth_date:'1-1-1996', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@outlook.com', curriculum_id: '5')
Student.create(id: "5731067221", first_name: 'นิธิรันดร์', 	last_name: 'นุ่มนนท์', picture: 'pic_url_here', ssn: '10000000123', birth_date:'1-1-1995', gender: 'Male', enroll_year: '2012', status: 'Studying', email: 'abcd@gmail.com', curriculum_id: '5')##

#Personnel_create
puts "Personnel create"
personnel = Personnel.create(
					first_name: "Name",	
					last_name: "Lastname",	
					ssn: "000000",	
					birth_date: rand(Date.civil(1970, 1, 1)..Date.civil(1995, 12, 31)),	
					gender: "M",	
					id: '1234567890', 	
					email: 'abcd@cu.com' , 	
					role: 'I', 	
					password: 'dbdbdbdb',
					manage_department_id: Department.first.id,	
			  		workin_department_id: Department.first.id
				)
for i in 0..35
	dTemp = Department.offset(i % Department.count).first
	dTemp2 = Department.offset(i % Department.count).first
	personnel = Personnel.create(
			   first_name: "Name#{i}",
			   	last_name: "Lastname#{i}",
			   ssn: "000000" + (100000 + i).to_s,
			   birth_date: rand(Date.civil(1970, 1, 1)..Date.civil(1995, 12, 31)),
			   gender: "M",
			   id: '12' + i.to_s, 
			   email: 'abcd' + i.to_s + '@cu.com' , 
			   role: 'I', 
			   manage_department_id: dTemp.id,
			   workin_department_id: dTemp2.id,
			   password: 'dbdbdbdb'
   )
end

#Advisor_create
puts "Advisor create"
for i in 0..((Student.count-1)*1.8).floor
	Advisor.create(student_id: Student.offset(i % Student.count).first.id,
	personnel_id: Personnel.offset(i % Personnel.count).first.id)
end

#Group_create
puts "Group create"
for i in 0..150
	Group.create(name: "GROUP NAME #{i}",
				)
end

#Belong_to_create
puts "BelongTo create"
student_id_count = 0
for i in 0..(Group.count-1)
	for j in 0..3
	BelongTo.create(student_id: Student.offset(student_id_count % Student.count).first.id,
					group_id: Group.offset(i % Group.count).first.id,
					)
	student_id_count += 1
	end
end

#Event_create
puts "Event create"
for i in 0..25
	if i % 5 == 0
		Event.create(date: rand(Date.civil(2014, 1, 1)..Date.civil(2017, 12, 31)),
						explanation: "Do something good!!",
						name: "Name of Event #{i}",
						isActivity: true,
						isCompetition: true)
	elsif i % 2 == 0
		Event.create(date: rand(Date.civil(2014, 1, 1)..Date.civil(2017, 12, 31)),
						explanation: "Do something good!!",
						name: "Name of Event #{i}",
						isActivity: true,
						isCompetition: false)
	else
		Event.create(date: rand(Date.civil(2014, 1, 1)..Date.civil(2017, 12, 31)),
						explanation: "Do something good!!",
						name: "Name of Event #{i}",
						isActivity: false,
						isCompetition: true)
	end
end

group_id_count = 0

#Participate_create: ISA of Event
puts "Participate create"
activity_position = ["Labor", "Leader", "Thinker", "Eater"]
for i in 0..40
	Participate.create(position: activity_position[rand(4)], 
					duration: rand(5)+1, 
					event_id: Event.offset(i % Event.count).first.id,
					group_id: Group.offset(group_id_count % Group.count).first.id)
	group_id_count += 2
end

#Competition_create: ISA of Event
puts "Compete create"
for i in 0..35
	Compete.create(award: ("#{rand(10)+1}st Place"),
					event_id: Event.offset(i % Event.count).first.id,
					group_id: Group.offset(group_id_count % Group.count).first.id)
	group_id_count += 2
end
group_id_count = 1

#Leave_create
puts "Leave create"
for i in 0..75
	if(12 <= i && i <= 13)
		date1 = Date.civil(2017, 1, 1)
		date2 = Date.civil(2017, 12, 31)
		Leave.create(start_date: date1,
					end_date: date2,
					group_id: Group.offset(group_id_count % Group.count).first.id,
					id: i)
	else
		date1 = rand(Date.civil(2014, 1, 1)..Date.civil(2017, 12, 31))
		date2 = date1 + rand(3)+1
		Leave.create(start_date: date1,
					end_date: date2,
					group_id: Group.offset(group_id_count % Group.count).first.id,
					id: i)
	end
	group_id_count += 2
end

#Personal_leave_create: ISA of Leave
puts "PersonalLeave create"
puts "SickLeave create"
for i in 0..75
	if i % 2 == 0
		PersonalLeave.create(project_name: "Project-#{rand(5)+1}",
							leave_id: Leave.offset(i % Leave.count).first.id)
	else
		SickLeave.create(reason: "Flu Number#{rand(5)+1}",
					leave_id: Leave.offset(i % Leave.count).first.id)
	end
end

rule_list = [
			"Steal others belonging",
			"Mug",
			"Murder",
			"Wear improper uniform"]
#Rule_create
puts "Rule create"
for i in 0..3
	Rule.create(rule_detail: rule_list[i],
				behavior_score_reduction: rand(5)*5,
				)
end

#Log_break_create
puts "LogBreak create"
for i in 0..(Student.count-1)
	LogBreak.create(remark: "Severity: #{rand(3)*5+5}",
					when: rand(Date.civil(2014, 1, 1)..Date.civil(2017, 12, 31)),
					rule_id: rand(Rule.count),
					student_id: Student.offset(i % Student.count).first.id,
					)
end

#Course_Category_create
puts "Code create"
Cat = ["GEN ED", "BUNG KUB", "GEN LANG"]
for i in 0..25
	Code.create(id: "#{i*10000+rand(10)+2000000}",
						department_id: Department.offset(rand(Department.count)).first.id,
						category: Cat[rand(3)])
end

#Course_create
puts "Course create"
for i in 0..25
	Course.create(name: "COURSE DUMMY \##{i}",
				code_id: Code.offset(i % Code.count).first.id,
				credit: rand(3)+1,
				)
end

#Section_create
puts "Section create"
for sec in 1..2
	for year in 2014..2017
		for sem in 1..3
			for course in 0..(Course.count-1)
				if (sec+year+sem+course) % 4 == 0
					Section.create(sec: sec,
								year: year,
								semester: sem,
								course_id: Course.offset(course).first.id,
								)
				end
			end
		end
	end
end

#Teach
puts "Teach create"
for i in 0..((Section.count*1.5).floor)
	Teach.create(personnel_id: Personnel.offset(i % Personnel.count).first.id,
				section_id: Section.offset(i % Section.count).first.id)
end

day_list = ["MON", "TUE", "WED", "TUE", "FRI", "SAT", "SUN"]
#Time_slot_create
puts "TimeSlot create"
for i in 0..50
	startTime = Time.parse("2015-11-16 15:00:00") + 60*60*(rand(3)+1)
	finishTime = startTime + 60*60*(rand(3)+1)
	TimeSlot.create(day: day_list[i % day_list.length],
					start: startTime,
					end: finishTime,
					)
end

#Schedule_create
puts "Schedule create"
for i in 0..((Section.count-1)*1.4).floor
	Schedule.create(section_id: Section.offset(i % Section.count).first.id,
					time_slot_id: TimeSlot.offset(i % TimeSlot.count).first.id)
end

#Enrollment_create
puts "Enrollment create"
learned = Hash.new
for j in 0..(Student.count-1)
	learned[Student.offset(j).first.id] = Hash.new

	for i in 0..(Section.count-1)
		if (j < (Student.count*0.90).floor)
			#Ungraduate
			if learned[Student.offset(j).first.id][Section.offset((i*i + j*j) % Section.count).first.course_id].nil?
				grade = (8 - rand(9)*rand(9) % 9)/2.0
				if(grade == 0.5)
					grade = -1.0
				end
				Enrollment.create(grade: grade, # A = 8, F = 0
								section_id: Section.offset((i*i + j*j) % Section.count).first.id,
								student_id: Student.offset(j).first.id)
				learned[Student.offset(j).first.id][Section.offset((i*i + j*j) % Section.count).first.course_id] = true
			end
		elsif (j < (Student.count*0.95).floor)
			#Probation
			if learned[Student.offset(j).first.id][Section.offset((i*i + j*j) % Section.count).first.course_id].nil?
				grade = (4 - rand(4) % 9)/2.0
				if(grade == 0.5)
					grade = -1.0
				end
				Enrollment.create(grade: grade, # A = 8, F = 0
								section_id: Section.offset((i*i + j*j) % Section.count).first.id,
								student_id: Student.offset(j).first.id)
				learned[Student.offset(j).first.id][Section.offset((i*i + j*j) % Section.count).first.course_id] = true
			end
		else
			if learned[Student.offset(j).first.id][Section.offset((i) % Section.count).first.course_id].nil?
				#Force Graduation
				grade = 4
				#puts Student.offset(j).first.id.to_s + "-" + Section.offset((i) % Section.count).first.course_id.to_s + "-" + grade.to_s
				Enrollment.create(grade: grade, # A = 8, F = 0
								section_id: Section.offset((i) % Section.count).first.id,
								student_id: Student.offset(j).first.id)
				learned[Student.offset(j).first.id][Section.offset((i) % Section.count).first.course_id] = true
			end
		end

	end
end


#Require_create
puts "Require create"
for i in 0..(Curriculum.count-1)
	for j in 0..12
		Require.create(curriculum_id: Curriculum.offset(i).first.id,
						course_id: Course.offset((i+j) % (Course.count)).first.id)
	end
end

#GPA_create
puts "Gpa create"
for i in 0..(Student.count-1)
	for j in 2014..2017
		for k in 1..3
			Gpa.create(year: j,
						semester: k,
						credit: rand(5)+16,
						gpa: (rand(381)+20)/100.0,
						student_id: Student.offset(i).first.id)
		end
	end
end

puts "Update All"
Student.all.each do |std|
	std.updateData
end

