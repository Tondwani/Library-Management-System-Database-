SELECT * FROM librarymanagement.users;

UPDATE users SET role_id = (SELECT role_id FROM roles WHERE role_name = 'Admin') WHERE username = 'Craig';
UPDATE users SET role_id = (SELECT role_id FROM roles WHERE role_name = 'Librarian') WHERE username = 'Phuti';
UPDATE users SET role_id = (SELECT role_id FROM roles WHERE role_name = 'Member') WHERE username = 'MemberUser';
