package server;

import sys.db.Mysql;
import ufront.application.UfrontApplication;
import ufront.ufadmin.controller.DBAdminController;
import ufront.ufadmin.controller.UFAdminController;
import ufront.web.Dispatch;
import app.Routes;
import app.Api;

class Server
{
	static var ufApp:UfrontApplication;
	static function main() {
		// enable caching if using mod_neko or mod_tora
		#if (neko && !debug) neko.Web.cacheModule(main); #end

		// This ensures each request is wrapped in a transaction, and if it fails, it will rollback. 
		// It will also close the connection after each request
		sys.db.Transaction.main( Mysql.connect(Config.db), function() {
			init(); // If caching is enabled, init() will only need to run once
			ufApp.execute(); // execute the current request
		});
	}

	static function init() {
		if (ufApp==null) {

			// Add ufadmin modules
			UFAdminController.addModule( "db", "Database", new DBAdminController() );

			// Set up the ufront application
			ufApp = new UfrontApplication({
				dispatchConfig: Dispatch.make( new Routes() ),
				remotingContext: Api,
				urlRewrite: true,
				logFile: "log/ufront.log"
			});

			// Include the models, so they will turn up in /ufadmin/db/
			app.model.Author;
			app.model.Category;
			app.model.Comment;
			app.model.Post;
			app.model.Tag;
			var classes = CompileTime.getAllClasses( ufront.db.Object );
		}
	}
}