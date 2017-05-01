import Foundation
import Kitura
import LoggerAPI
import Fluent
import FluentMySQL
import Configuration

public class DatabaseContext {
    public static var database: Database?
    public static var driver: MySQLDriver?
    
    init() {
        
    }
    
    public class func use()
    {
        let manager = ConfigurationManager()
        manager.load(file: "./Config/mysql.json", relativeFrom: .project)
        let host = manager["host"] as? String
        let user = manager["user"] as? String
        let password = manager["password"] as? String
        let database = manager["database"] as? String
        let port = manager["port"] as? UInt
        let flag = manager["flag"] as? UInt
        let encoding = manager["encoding"] as? String


        do
        {
            let driver = try MySQLDriver(
                host: host ?? "localhost",
                user: user ?? "root",
                password: password!,
                database: database!,
                port: port ?? 3306,
                flag: flag ?? 0,
                encoding: encoding ?? "utf8"
            )
            
            DatabaseContext.driver = driver
            DatabaseContext.database = Database(driver)
            Database.default = DatabaseContext.database
            
        }catch {
            Log.error("init MySQLDriver error")
        }
        
    }

}
