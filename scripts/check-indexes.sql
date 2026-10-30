SELECT name, tbl_name FROM sqlite_master WHERE type = 'index' AND tbl_name NOT LIKE 'sqlite_%' ORDER BY tbl_name, name
