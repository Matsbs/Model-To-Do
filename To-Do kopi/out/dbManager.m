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
    _databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:@"TASK.db"]];
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        char *errMsg;
        const char *sql_stmt;
		sql_stmt = "CREATE TABLE IF NOT EXISTS CATEGORY1S (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)";
		if (sqlite3_exec(_TASKDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK){
        	NSLog(@"%s",sqlite3_errmsg(_TASKDB));
		}
		sql_stmt = "CREATE TABLE IF NOT EXISTS NOTES (ID INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT)";
		if (sqlite3_exec(_TASKDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK){
        	NSLog(@"%s",sqlite3_errmsg(_TASKDB));
		}
		sql_stmt = "CREATE TABLE IF NOT EXISTS TASKS (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, date TEXT)";
		if (sqlite3_exec(_TASKDB, sql_stmt, NULL, NULL, &errMsg) != SQLITE_OK){
        	NSLog(@"%s",sqlite3_errmsg(_TASKDB));
		}
        sqlite3_close(_TASKDB);
    } 
}

- (void)setDbPath{
    NSString *docsDir;
    NSArray *dirPaths;
    dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    self.databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:@"TASK.db"]];
}

- (int)insertCategory1:(Category1 *category1){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO CATEGORY1S (name) VALUES (\"%@\")", category1.name];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_TASKDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Category1 inserted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_TASKDB));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_TASKDB);
    }
   return (int)sqlite3_last_insert_rowid(_TASKDB);
}

- (void)deleteCategory1:(Category1 *category1){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"DELETE FROM CATEGORY1S WHERE (ID) = (\"%d\")", category1.category1Id];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_TASKDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Category1 deleted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_TASKDB));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_TASKDB);
    }
}

- (void)updateCategory1:(Category1 *category1){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"UPDATE CATEGORY1S SET name = \"%@\" WHERE ID = \"%d\"", category1.name, category1.category1Id ];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_TASKDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Category1 updated");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_TASKDB));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_TASKDB);
    }
}

- (NSMutableArray*)getAllCategory1s{
    NSMutableArray *Category1s =[[NSMutableArray alloc] init];
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM CATEGORY1S" ];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_TASKDB,query_stmt, -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW){
                Category1 *newCategory1 = [[Category1 alloc]init];
				newTask.taskID = sqlite3_column_int(statement, 0);
				newCategory1.name = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_tex(statement,1); 
                [Category1s addObject:newCategory1];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_TASKDB);
    }
    return Tasks;
}



- (int)insertNote:(Note *note){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO NOTES (description) VALUES (\"%@\")", note.description];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_TASKDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Note inserted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_TASKDB));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_TASKDB);
    }
   return (int)sqlite3_last_insert_rowid(_TASKDB);
}

- (void)deleteNote:(Note *note){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"DELETE FROM NOTES WHERE (ID) = (\"%d\")", note.noteId];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_TASKDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Note deleted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_TASKDB));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_TASKDB);
    }
}

- (void)updateNote:(Note *note){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"UPDATE NOTES SET description = \"%@\" WHERE ID = \"%d\"", note.description, note.noteId ];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_TASKDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Note updated");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_TASKDB));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_TASKDB);
    }
}

- (NSMutableArray*)getAllNotes{
    NSMutableArray *Notes =[[NSMutableArray alloc] init];
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM NOTES" ];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_TASKDB,query_stmt, -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW){
                Note *newNote = [[Note alloc]init];
				newTask.taskID = sqlite3_column_int(statement, 0);
				newNote.description = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_tex(statement,1); 
                [Notes addObject:newNote];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_TASKDB);
    }
    return Tasks;
}



- (int)insertTask:(Task *task){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO TASKS (description, name, date) VALUES (\"%@\", \"%@\", \"%@\")", task.date, task.name, task.description];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_TASKDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Task inserted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_TASKDB));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_TASKDB);
    }
   return (int)sqlite3_last_insert_rowid(_TASKDB);
}

- (void)deleteTask:(Task *task){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"DELETE FROM TASKS WHERE (ID) = (\"%d\")", task.taskId];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_TASKDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Task deleted");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_TASKDB));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_TASKDB);
    }
}

- (void)updateTask:(Task *task){
    sqlite3_stmt *statement;
    const char *dbpath = [_databasePath UTF8String];
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *insertSQL = [NSString stringWithFormat:@"UPDATE TASKS SET description = \"%@\", date = \"%@\", name = \"%@\" WHERE ID = \"%d\"", task.date, task.name, task.description, task.taskId ];
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(_TASKDB, insert_stmt,-1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE){
            NSLog(@"Task updated");
        }else{
            NSLog(@"%s",sqlite3_errmsg(_TASKDB));
        }
        sqlite3_reset(statement);
        sqlite3_finalize(statement);
        sqlite3_close(_TASKDB);
    }
}

- (NSMutableArray*)getAllTasks{
    NSMutableArray *Tasks =[[NSMutableArray alloc] init];
    const char *dbpath = [_databasePath UTF8String];
    sqlite3_stmt *statement;
    if (sqlite3_open(dbpath, &_TASKDB) == SQLITE_OK){
        NSString *querySQL = [NSString stringWithFormat:@"SELECT * FROM TASKS" ];
        const char *query_stmt = [querySQL UTF8String];
        if (sqlite3_prepare_v2(_TASKDB,query_stmt, -1, &statement, NULL) == SQLITE_OK){
            while (sqlite3_step(statement) == SQLITE_ROW){
                Task *newTask = [[Task alloc]init];
				newTask.taskID = sqlite3_column_int(statement, 0);
				newTask.name = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_tex(statement,1); 
				newTask.date = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_tex(statement,1); 
				newTask.description = [[NSString alloc]initWithUTF8String:(const char *) sqlite3_column_tex(statement,1); 
                [Tasks addObject:newTask];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(_TASKDB);
    }
    return Tasks;
}



@end
