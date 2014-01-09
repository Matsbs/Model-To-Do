//
//  DBManager.m
//  To-Do
//
//  Created by Mats Sandvoll on 02.12.13.
//  Copyright (c) 2013 Mats Sandvoll. All rights reserved.
//
#import "DBManager.h"

@implementation DBManager

- (void)initDatabase{
    NSString *docsDir;
    NSArray *dirPaths;
    // Get the documents directory
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // Build the path to the database file
    _databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:@"DATABASE.db"]];
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        char *errMsg;
        const char *sql_stmt;
		sql_stmt = "CREATE TABLE IF NOT EXISTS TASKS (ID INTEGER PRIMARY KEY AUTOINCREMENT, Image TEXT, Name TEXT)";
		if (sqlite3_exec(_DATABASE, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK){
        	NSLog(@"%s",sqlite3_errmsg(_DATABASE));
		}
		sql_stmt = "CREATE TABLE IF NOT EXISTS NOTES (ID INTEGER PRIMARY KEY AUTOINCREMENT, Url TEXT)";
		if (sqlite3_exec(_DATABASE, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK){
        	NSLog(@"%s",sqlite3_errmsg(_DATABASE));
		}
		sql_stmt = "CREATE TABLE IF NOT EXISTS HOUSES (ID INTEGER PRIMARY KEY AUTOINCREMENT, )";
		if (sqlite3_exec(_DATABASE, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK){
        	NSLog(@"%s",sqlite3_errmsg(_DATABASE));
		}
		sql_stmt = "CREATE TABLE IF NOT EXISTS CATEGORYS (ID INTEGER PRIMARY KEY AUTOINCREMENT, Title TEXT)";
		if (sqlite3_exec(_DATABASE, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK){
        	NSLog(@"%s",sqlite3_errmsg(_DATABASE));
		}
        sqlite3_close(_DATABASE);
    } 
}

- (void)setDbPath{
    NSString *docsDir;
    NSArray *dirPaths;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    self.databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:@"DATABASE.db"]];
}

- (int)insertTask:(Task *task){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO TASKS (Name, Image) VALUES (\"%@\", \"%@\")", task.image, task.name];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Task inserted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
   return (int)sqlite3_last_insert_rowid(_DATABASE);
}

- (void)deleteTask:(Task *task){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"DELETE FROM TASKS WHERE (ID) = (\"%d\")", task.taskId];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Task deleted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
}

- (void)updateTask:(Task *task){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"UPDATE TASKS SET image = \"%@\", name = \"%@\" WHERE ID = \"%d\"", task.image, task.name, task.taskId ];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Task updated");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
}

- (NSMutableArray*)getAllTasks{
    NSMutableArray *Tasks =[[NSMutableArray alloc] init];
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM TASKS" ];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_DATABASE,query_stmt, -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW){
                Task *newTask = [[Task alloc]init];
				newTask.taskID = sqlite3_column_int(statement, 0);
				newTask.name = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_tex(statement,1); 
				newTask.image = (statement,1); 
                [Tasks addObject:newTask];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_DATABASE);
    }
    return Tasks;
}



- (int)insertNote:(Note *note){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO NOTES (Url) VALUES (\"%@\")", note.url];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Note inserted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
   return (int)sqlite3_last_insert_rowid(_DATABASE);
}

- (void)deleteNote:(Note *note){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"DELETE FROM NOTES WHERE (ID) = (\"%d\")", note.noteId];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Note deleted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
}

- (void)updateNote:(Note *note){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"UPDATE NOTES SET url = \"%@\" WHERE ID = \"%d\"", note.url, note.noteId ];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Note updated");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
}

- (NSMutableArray*)getAllNotes{
    NSMutableArray *Notes =[[NSMutableArray alloc] init];
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM NOTES" ];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_DATABASE,query_stmt, -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW){
                Note *newNote = [[Note alloc]init];
				newTask.taskID = sqlite3_column_int(statement, 0);
				newNote.url = (statement,1); 
                [Notes addObject:newNote];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_DATABASE);
    }
    return Tasks;
}



- (int)insertHouse:(House *house){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO HOUSES () VALUES ()", ];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"House inserted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
   return (int)sqlite3_last_insert_rowid(_DATABASE);
}

- (void)deleteHouse:(House *house){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"DELETE FROM HOUSES WHERE (ID) = (\"%d\")", house.houseId];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"House deleted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
}

- (void)updateHouse:(House *house){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"UPDATE HOUSES SET  WHERE ID = \"%d\"", , house.houseId ];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"House updated");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
}

- (NSMutableArray*)getAllHouses{
    NSMutableArray *Houses =[[NSMutableArray alloc] init];
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM HOUSES" ];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_DATABASE,query_stmt, -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW){
                House *newHouse = [[House alloc]init];
				newTask.taskID = sqlite3_column_int(statement, 0);
                [Houses addObject:newHouse];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_DATABASE);
    }
    return Tasks;
}



- (int)insertCategory:(Category *category){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO CATEGORYS (Title) VALUES (\"%@\")", category.title];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Category inserted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
   return (int)sqlite3_last_insert_rowid(_DATABASE);
}

- (void)deleteCategory:(Category *category){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"DELETE FROM CATEGORYS WHERE (ID) = (\"%d\")", category.categoryId];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Category deleted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
}

- (void)updateCategory:(Category *category){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"UPDATE CATEGORYS SET title = \"%@\" WHERE ID = \"%d\"", category.title, category.categoryId ];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_DATABASE, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Category updated");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_DATABASE));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_DATABASE);
    }
}

- (NSMutableArray*)getAllCategorys{
    NSMutableArray *Categorys =[[NSMutableArray alloc] init];
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &_DATABASE) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM CATEGORYS" ];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_DATABASE,query_stmt, -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW){
                Category *newCategory = [[Category alloc]init];
				newTask.taskID = sqlite3_column_int(statement, 0);
				newCategory.title = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_tex(statement,1); 
                [Categorys addObject:newCategory];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_DATABASE);
    }
    return Tasks;
}



@end
