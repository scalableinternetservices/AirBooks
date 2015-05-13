User.create!([
  {email: "abcde@gmail.com", encrypted_password: "$2a$10$bTzke/vcB9nkvklHbWVksuHiC3zYwq7U5cuQvsTPk7JyRxcnQbXuG", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2015-04-25 00:17:41", last_sign_in_at: "2015-04-25 00:15:12", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Matt Agra", phone: "555-5555", location: "Los Angeles, CA", balance_id: nil, user_balance_id: nil},
  {email: "asdf@gmail.com", encrypted_password: "$2a$10$kSUtNp4Q8U/egtbjZLgoCODk1tfVDLUYCYR0f3hR0xZNNrcM8Vv2S", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-04-25 00:09:00", last_sign_in_at: "2015-04-25 00:08:22", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Daasdf", phone: "", location: "", balance_id: nil, user_balance_id: nil},
  {email: "abcdef@gmail.com", encrypted_password: "$2a$10$IYCt7fVMYWuHpc3Vbr2DiOID8VigXDKsDUrGSef7Zm7MeKHuU3R/S", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-01 23:50:35", last_sign_in_at: "2015-05-01 23:50:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Matt 2", phone: nil, location: nil, balance_id: nil, user_balance_id: nil},
  {email: "abcdefg@gmail.com", encrypted_password: "$2a$10$lTDhdCgz2nmR4Rl2o0RKC.XlMM7gcZxs2AXaW26HsQIDRfUdvsPqy", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-02 00:00:31", last_sign_in_at: "2015-05-02 00:00:31", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Matt 3", phone: nil, location: nil, balance_id: nil, user_balance_id: nil},
  {email: "test+adam@gmail.com", encrypted_password: "$2a$10$xZ/gUM9T/v1jccgtyReHwebflOqnaQGX0kyyc6VfkYwnEkay2XKOi", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-05-13 23:38:14", last_sign_in_at: "2015-05-13 23:28:09", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Adam", phone: nil, location: nil, balance_id: nil, user_balance_id: nil},
  {email: "test+dan@gmail.com", encrypted_password: "$2a$10$t5/v54GqMRk3wsPnaRIwHuNA0L/sEmG91xYB3I7XmsOAaImn02d5S", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2015-05-13 23:42:41", last_sign_in_at: "2015-05-13 23:28:39", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Dan", phone: nil, location: nil, balance_id: nil, user_balance_id: nil},
  {email: "test+robert@gmail.com", encrypted_password: "$2a$10$K9NoN/40uqIw/fBvVfIIQ.OBWvNWQv9yMNXZAUXBwwUjKQn78.7Ia", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-13 23:28:59", last_sign_in_at: "2015-05-13 23:28:59", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Robert", phone: nil, location: nil, balance_id: nil, user_balance_id: nil},
  {email: "test+zach@gmail.com", encrypted_password: "$2a$10$as7dZpV7zj2iRZ1kb.4IB.0RkZgnEzvxOvbgfcPU3mol8hRceL1W2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-05-13 23:29:18", last_sign_in_at: "2015-05-13 23:29:18", current_sign_in_ip: "::1", last_sign_in_ip: "::1", name: "Zach", phone: nil, location: nil, balance_id: nil, user_balance_id: nil}
])
Book.create!([
  {title: "My Book", author: "John Doe", isbn: "23232342342", condition: "Good", comments: "", owner_email: "abcdefg@gmail.com", price: "13.4", due_date: "2015-05-02", image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, genre: nil, checked_out: false},
  {title: "Awesome Book", author: "Jacob Smith", isbn: "1232342345", condition: "Good", comments: "", owner_email: "abcdefg@gmail.com", price: "42.13", due_date: "2015-05-13", image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, genre: nil, checked_out: false},
  {title: "Harry Potter", author: "J.K. Rowling", isbn: "123456789", condition: "New", comments: "", owner_email: nil, price: nil, due_date: nil, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, genre: nil, checked_out: false},
  {title: "Harry Potter", author: "J.K. Rowling", isbn: "123456789", condition: "New", comments: "", owner_email: nil, price: nil, due_date: nil, image_file_name: nil, image_content_type: nil, image_file_size: nil, image_updated_at: nil, genre: nil, checked_out: false},
  {title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", isbn: "978-0439708180", condition: "New", comments: "", owner_email: "test+zach@gmail.com", price: "0.49", due_date: "2015-08-13", image_file_name: "harry1.jpg", image_content_type: "image/jpeg", image_file_size: 46844, image_updated_at: "2015-05-13 23:34:56", genre: "Fantasy", checked_out: false},
  {title: "The Cat in the Hat", author: "Dr. Seuss", isbn: "978-0394800011", condition: "Good", comments: "", owner_email: "test+zach@gmail.com", price: "0.1", due_date: "2015-10-13", image_file_name: "cat.jpg", image_content_type: "image/jpeg", image_file_size: 39181, image_updated_at: "2015-05-13 23:36:35", genre: "Fantasy", checked_out: false},
  {title: "Twilight (The Twilight Saga, Book 1)", author: "Stephenie Meyer", isbn: "978-0316015844", condition: "Like New", comments: "", owner_email: "test+adam@gmail.com", price: "0.53", due_date: "2015-11-13", image_file_name: "twilight.jpg", image_content_type: "image/jpeg", image_file_size: 22799, image_updated_at: "2015-05-13 23:39:48", genre: "Fantasy", checked_out: false},
  {title: "One Fish Two Fish Red Fish Blue Fish", author: "Dr. Seuss", isbn: "978-0394800134", condition: "Poor", comments: "", owner_email: "test+adam@gmail.com", price: "0.13", due_date: "2015-12-13", image_file_name: "one.jpg", image_content_type: "image/jpeg", image_file_size: 44495, image_updated_at: "2015-05-13 23:42:03", genre: "Fantasy", checked_out: false},
  {title: "Eragon (Inheritance, Book 1)", author: "Christopher Paolini", isbn: "978-0375826696", condition: "Good", comments: "", owner_email: "test+dan@gmail.com", price: "0.24", due_date: "2015-11-13", image_file_name: "eragon.jpg", image_content_type: "image/jpeg", image_file_size: 81848, image_updated_at: "2015-05-13 23:44:04", genre: "Fantasy", checked_out: false},
  {title: "The Wright Brothers", author: "David McCullough", isbn: "978-1476728742", condition: "Like New", comments: "", owner_email: "test+dan@gmail.com", price: "0.68", due_date: "2015-12-13", image_file_name: "david.jpg", image_content_type: "image/jpeg", image_file_size: 43394, image_updated_at: "2015-05-13 23:46:04", genre: "Non-fiction", checked_out: false}
])
BookReview.create!([
  {book_id: 1, user_id: 4, rating: 4, review: "hi there\r\n"},
  {book_id: 1, user_id: 4, rating: 4, review: "very good!"},
  {book_id: 1, user_id: 4, rating: 4, review: "What an excellent book!"},
  {book_id: 1, user_id: 4, rating: 3, review: "asdfsef"},
  {book_id: 2, user_id: 4, rating: 2, review: "lame"},
  {book_id: 2, user_id: 4, rating: 1, review: "whatever"},
  {book_id: 5, user_id: 8, rating: 5, review: "Great book! Yay Harry!"},
  {book_id: 7, user_id: 5, rating: 1, review: "This sucks"},
  {book_id: 8, user_id: 5, rating: 4, review: "Great for the kids!"},
  {book_id: 9, user_id: 6, rating: 3, review: "this is pretty good"},
  {book_id: 10, user_id: 6, rating: 5, review: "so inspirational"}
])
UserBalance.create!([
  {balance: "87.0", user_id: 4},
  {balance: "50.0", user_id: 6}
])
